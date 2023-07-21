#include "Function.h"
#include "Condition.h"
#include "ForLoop.h"

#include "AST.h"
#include "Lexer.h"
#include "Parser.h"
#include "SemanticAnalyzer.h"
#include "IRGenerator.h"

int main(int argc, const char *argv[])
{
//    Function func;
//    func.codegen();
//    Condition cond;
//    cond.codegen();
//    ForLoop loop;
//    loop.codegen();
    llvm::StringRef input("with a,b: (a+b)*3");
    Lexer lexer(input);
//    lexer.Codegen();
    Parser parser(lexer);
//    parser.Codegen();
    AST* tree = parser.Parse();
    if (!tree || parser.HasError())
    {
        llvm::errs() << "Syntax errors occured\n";
        return 1;
    }

    SemanticAnalyzer semanticAnalyzer;
    if (semanticAnalyzer.Analysis(tree))
    {
        llvm::errs() << "Semantic errors occured\n";
        return 1;
    }

    IRGenerator irGenerator;
    irGenerator.Generate(tree);
	return 0;
}
