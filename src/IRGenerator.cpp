#include "IRGenerator.h"

#include "llvm/ADT/StringMap.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/Support/raw_ostream.h"

namespace
{
    class IRGeneratorImpl : public ASTVisitor
    {
        llvm::Module* m_module;
        llvm::IRBuilder<> m_builder;
        llvm::Value* m_value;
        llvm::StringMap<llvm::Value*> m_name_map;
        
        llvm::Type* voidType;
        llvm::Type* int32Type;
        llvm::Type* int8PtrType;
        llvm::Type* int8PtrPtrType;
        llvm::Constant* int32Zero;

    public:

        IRGeneratorImpl(llvm::Module* inModule) :
        m_module(inModule),
        m_builder(inModule->getContext())
        {
            voidType = llvm::Type::getVoidTy(m_module->getContext());
            int32Type = llvm::Type::getInt32Ty(m_module->getContext());
            int8PtrType = llvm::Type::getInt8PtrTy(m_module->getContext());
            int8PtrPtrType = int8PtrType->getPointerTo();
            int32Zero = llvm::ConstantInt::get(int32Type, 0, true);
        }

        void Generate(AST* tree)
        {
            llvm::FunctionType* mainFunctionType = llvm::FunctionType::get(int32Type, {int32Type, int8PtrPtrType}, false);
            llvm::Function* mainFunction = llvm::Function::Create(mainFunctionType, llvm::GlobalValue::ExternalLinkage, "main", m_module);
            llvm::BasicBlock* basicBlock = llvm::BasicBlock::Create(m_module->getContext(), "entry", mainFunction);
            m_builder.SetInsertPoint(basicBlock);

            tree->Accept(*this);

            llvm::FunctionType* calculatorWriteFunctionType = llvm::FunctionType::get(voidType, {int32Type}, false);
            llvm::Function* calculatorWriteFunction = llvm::Function::Create(calculatorWriteFunctionType, llvm::GlobalValue::ExternalLinkage, "calc_write", m_module);
            m_builder.CreateCall(calculatorWriteFunctionType, calculatorWriteFunction, {m_value});

            m_builder.CreateRet(int32Zero);
        }

        void Visit(Factor& node) override
        {
            if (node.GetType() == Factor::kIdent)
            {
                m_value = m_name_map[node.GetValue()];
            }
            else
            {
                int intValue;
                node.GetValue().getAsInteger(10, intValue);
                m_value = llvm::ConstantInt::get(int32Type, intValue, true);
            }
        };

        void Visit(BinaryOp& node) override
        {
            node.GetLeft()->Accept(*this);
            llvm::Value* left = m_value;

            node.GetRight()->Accept(*this);
            llvm::Value* right = m_value;

            switch (node.GetOperator())
            {
                case BinaryOp::kPlus:
                    m_value = m_builder.CreateNSWAdd(left, right);
                    break;
                case BinaryOp::kMinus:
                    m_value = m_builder.CreateNSWSub(left, right);
                    break;
                case BinaryOp::kMultiple:
                    m_value = m_builder.CreateNSWMul(left, right);
                    break;
                case BinaryOp::kDivide:
                    m_value = m_builder.CreateSDiv(left, right);
                    break;
            }
        };

        void Visit(WithDeclaration& node) override
        {
            llvm::FunctionType* calculatorReadFunctionType = llvm::FunctionType::get(int32Type, {int8PtrType}, false);
            llvm::Function* calculatorReadFunction = llvm::Function::Create(calculatorReadFunctionType, llvm::GlobalValue::ExternalLinkage, "calc_read", m_module);
            for (const auto& variable : node)
            {
                // Create call to CalculatorRead function
                llvm::Constant* strText = llvm::ConstantDataArray::getString(m_module->getContext(), variable);
                llvm::GlobalVariable* str = new llvm::GlobalVariable(*m_module,
                                                                     strText->getType(),
                                                                     /*isConstant=*/true,
                                                                     llvm::GlobalValue::PrivateLinkage,
                                                                     strText,
                                                                     llvm::Twine(variable).concat(".str"));
                llvm::Value* ptr = m_builder.CreateInBoundsGEP(str->getType(), str, {int32Zero, int32Zero}, "ptr");
                llvm::CallInst* call = m_builder.CreateCall(calculatorReadFunctionType, calculatorReadFunction, {ptr});

                m_name_map[variable] = call;
            }

            node.GetExpr()->Accept(*this);
        };
    };
} // namespace

void IRGenerator::Generate(AST* tree)
{
    llvm::LLVMContext context;
    llvm::Module* module = new llvm::Module("Calculate.Module", context);
    IRGeneratorImpl generator(module);
    generator.Generate(tree);
    module->print(llvm::outs(), nullptr);
}
