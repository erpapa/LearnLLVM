#include "Function.h"
#include <vector>
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"

Function::Function()
{
}

Function::~Function()
{
}

/**
 // Test.c
 int globalVariable;
 void Test(int a, int b) {
     return a * 3;
 }
 */
void Function::codegen()
{
    llvm::LLVMContext context;
    llvm::IRBuilder<> builder(context);

    // Create a module
    llvm::Module* module = new llvm::Module("Test.c", context);

    // Add a global variable
    module->getOrInsertGlobal("globalVariable", builder.getInt32Ty());
    llvm::GlobalVariable* globalVariable = module->getNamedGlobal("globalVariable");
    globalVariable->setLinkage(llvm::GlobalValue::CommonLinkage);
    globalVariable->setAlignment(llvm::MaybeAlign(4));

    // Add a function
    std::vector<llvm::Type*> parameters(2, builder.getInt32Ty());
    llvm::FunctionType* functionType = llvm::FunctionType::get(builder.getInt32Ty(), parameters, false);
    llvm::Function* function = llvm::Function::Create(functionType, llvm::GlobalValue::ExternalLinkage, "Test", module);

    // Set arguments for the function
    function->getArg(0)->setName("a");
    function->getArg(1)->setName("b");

    // Create a block
    llvm::BasicBlock* block = llvm::BasicBlock::Create(context, "entry", function);
    builder.SetInsertPoint(block);

    // Create an arithmetic statement
    llvm::Value* arg1 = function->getArg(0);
    llvm::ConstantInt* three = builder.getInt32(3);
    llvm::Value* result = builder.CreateMul(arg1, three, "result");

    // Add a return
    builder.CreateRet(result);

    // Print the IR
    llvm::verifyFunction(*function);
    module->print(llvm::outs(), nullptr);
}
