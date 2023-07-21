#include "ForLoop.h"
#include <vector>
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"

ForLoop::ForLoop()
{
}

ForLoop::~ForLoop()
{
}

/**
 // Test.c
 int Test(int a) {
     int b = 0;
     for (int i = 0; i < a; i++) {
         b = b + i;
     }
     return b;
 }
 */
void ForLoop::codegen()
{
    llvm::LLVMContext context;
    llvm::IRBuilder<> builder(context);

    // Create a module
    llvm::Module* module = new llvm::Module("Test.c", context);

    // Add a function with argument
    //   int Test(int a)
    std::vector<llvm::Type*> parameters(1, builder.getInt32Ty());
    llvm::FunctionType* functionType = llvm::FunctionType::get(builder.getInt32Ty(), parameters, false);
    llvm::Function* function = llvm::Function::Create(functionType, llvm::GlobalValue::ExternalLinkage, "Test", module);
    llvm::Value* a = function->getArg(0);
    a->setName("a");

    // Add some basic blocks to the function
    llvm::BasicBlock* entryBlock = llvm::BasicBlock::Create(context, "entry", function);
    llvm::BasicBlock* forConditionBlock = llvm::BasicBlock::Create(context, "condition", function);
    llvm::BasicBlock* forBodyBlock = llvm::BasicBlock::Create(context, "body", function);
    llvm::BasicBlock* forIncrementBlock = llvm::BasicBlock::Create(context, "increment", function);
    llvm::BasicBlock* forEndBlock = llvm::BasicBlock::Create(context, "end", function);

    // Fill the "entry" block (1):
    //   int b = 0;
    builder.SetInsertPoint(entryBlock);
    llvm::Value* bPtr = builder.CreateAlloca(builder.getInt32Ty(), nullptr, "b_val");
    builder.CreateStore(builder.getInt32(0), bPtr);

    // Fill the "entry" block (2):
    //   for (int i = 0; ...)
    llvm::Value* iPtr = builder.CreateAlloca(builder.getInt32Ty(), nullptr, "i_val");
    builder.CreateStore(builder.getInt32(0), iPtr);
    builder.CreateBr(forConditionBlock);

    // Fill the "condition" block:
    //   for (... i < a; ...)
    builder.SetInsertPoint(forConditionBlock);
    llvm::Value* i0 = builder.CreateLoad(builder.getInt32Ty(), iPtr);
    llvm::Value* forConditionCompare = builder.CreateICmpSLT(i0, a, "cmp_ret");
    builder.CreateCondBr(forConditionCompare, forBodyBlock, forEndBlock);

    // Fill the "body" block:
    //   b = b + i;
    builder.SetInsertPoint(forBodyBlock);
    llvm::Value* b0 = builder.CreateLoad(builder.getInt32Ty(), bPtr);
    llvm::Value* i1 = builder.CreateLoad(builder.getInt32Ty(), iPtr);
    llvm::Value* addResult = builder.CreateAdd(b0, i1, "add_val");
    builder.CreateStore(addResult, bPtr);
    builder.CreateBr(forIncrementBlock);

    // Fill the "increment" block:
    //   for (... i++)
    builder.SetInsertPoint(forIncrementBlock);
    llvm::Value* i2 = builder.CreateLoad(builder.getInt32Ty(), iPtr);
    llvm::Value* incrementedI = builder.CreateAdd(i2, builder.getInt32(1), "inc_ret");
    builder.CreateStore(incrementedI, iPtr);
    builder.CreateBr(forConditionBlock);

    // Fill the "end" block:
    //   return b;
    builder.SetInsertPoint(forEndBlock);
    llvm::Value* returnValue = builder.CreateLoad(builder.getInt32Ty(), bPtr, "result");
    builder.CreateRet(returnValue);

    // Print the IR
    llvm::verifyFunction(*function);
    module->print(llvm::outs(), nullptr);
}
