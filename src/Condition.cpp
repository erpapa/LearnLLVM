#include "Condition.h"
#include <vector>
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"

Condition::Condition()
{
}

Condition::~Condition()
{
}

/**
 // Test.c
 int Test(int a) {
     int b;
     if (a > 33) {
         b = 66;
     } else {
         b = 77;
     }
     return b;
 }
 */
void Condition::codegen()
{
    llvm::LLVMContext context;
    llvm::IRBuilder<> builder(context);

    // Create a module
    llvm::Module* module = new llvm::Module("Test.c", context);

    // Add a function
    std::vector<llvm::Type*> parameters(1, builder.getInt32Ty());
    llvm::FunctionType* functionType = llvm::FunctionType::get(builder.getInt32Ty(), parameters, false);
    llvm::Function* function = llvm::Function::Create(functionType, llvm::GlobalValue::ExternalLinkage, "Test", module);

    // Add an argument to the function
    llvm::Value* arg = function->getArg(0);
    arg->setName("a");

    // Add some basic blocks to the function
    llvm::BasicBlock* entryBlock = llvm::BasicBlock::Create(context, "entry", function);
    llvm::BasicBlock* thenBlock = llvm::BasicBlock::Create(context, "then", function);
    llvm::BasicBlock* elseBlock = llvm::BasicBlock::Create(context, "else", function);
    llvm::BasicBlock* returnBlock = llvm::BasicBlock::Create(context, "end", function);

    // Fill the "entry" block (1):
    //   int b;
    builder.SetInsertPoint(entryBlock);
    llvm::Value* bPtr = builder.CreateAlloca(builder.getInt32Ty(), nullptr, "b_val");

    // Fill the "entry" block (2):
    //   if (a > 33)
    llvm::ConstantInt* value33 = builder.getInt32(33);
    llvm::Value* condition = builder.CreateICmpSGT(arg, value33, "cmp_ret");
    builder.CreateCondBr(condition, thenBlock, elseBlock);

    // Fill the "then" block:
    //   b = 66;
    builder.SetInsertPoint(thenBlock);
    llvm::ConstantInt* value66 = builder.getInt32(66);
    builder.CreateStore(value66, bPtr); // 如果是phi指令，注释该行
    builder.CreateBr(returnBlock);

    // Fill the "else" block:
    //   b = 77;
    builder.SetInsertPoint(elseBlock);
    llvm::ConstantInt* value77 = builder.getInt32(77);
    builder.CreateStore(value77, bPtr); // 如果是phi指令，注释该行
    builder.CreateBr(returnBlock);

    // Fill the "end" block:
    //   return b;
    builder.SetInsertPoint(returnBlock);
    // 如果是phi指令，加上以下代码
//    llvm::PHINode* phi = builder.CreatePHI(builder.getInt32Ty(), 2);
//    phi->addIncoming(value66, thenBlock);
//    phi->addIncoming(value77, elseBlock);
//    builder.CreateStore(phi, bPtr);
    llvm::Value* returnValue = builder.CreateLoad(builder.getInt32Ty(), bPtr, "result");
    builder.CreateRet(returnValue);

    // Print the IR
    llvm::verifyFunction(*function);
    module->print(llvm::outs(), nullptr);
}
