#include "Parser.h"

namespace
{
    class ASTPrinter : public ASTVisitor
    {
    public:
        
        virtual void Visit(Factor& node) override
        {
            llvm::outs() << "Factor: " << node.GetValue() << "\n";
        };
        
        virtual void Visit(BinaryOp& node) override
        {
            llvm::outs() << "\n"
            << node.GetDisplayText() << node.GetDisplayText() << node.GetDisplayText()
            << node.GetDisplayText() << "\n";
            llvm::outs() << "BinaryOp: " << node.GetDisplayText() << "\n";
            
            if (node.GetLeft())
            {
                node.GetLeft()->Accept(*this);
            }
            
            if (node.GetRight())
            {
                node.GetRight()->Accept(*this);
            }
            
            llvm::outs() << node.GetDisplayText() << node.GetDisplayText() << node.GetDisplayText()
            << node.GetDisplayText() << "\n\n";
        };
        
        virtual void Visit(WithDeclaration& node) override
        {
            llvm::outs() << "with variables: ";
            for (auto var : node)
            {
                llvm::outs() << var << " ";
            }
            
            llvm::outs() << "\n";
            
            if (node.GetExpr())
            {
                node.GetExpr()->Accept(*this);
            }
        };
    };
} // namespace

AST* Parser::Parse()
{
    AST* tree = ParseSource();
    CheckNextToken(Token::kEOI);
    return tree;
}

/**
 * with a,b: (a+b)*3
 */
AST* Parser::ParseSource()
{
    // TODO: 1、当前token:"with", 剩余字符:" a,b: (a+b)*3"
    Expr* expr;
    llvm::SmallVector<llvm::StringRef, 8> variables;
    if (token.Is(Token::kKeywordWith))
    {
        Advance(); // 略过空格，拿到字符"a"
        // TODO: 2、当前token:"a", 剩余字符:",b: (a+b)*3"
        if (CheckNextToken(Token::kIdent))
        {
            goto errorTag;
        }

        variables.push_back(token.GetText());
        Advance(); // 拿到逗号","
        // TODO: 3、当前token:",", 剩余字符:"b: (a+b)*3"
        while (token.Is(Token::kComma))
        {
            Advance(); // 拿到字符"b"
            // TODO: 4、当前token:"b", 剩余字符:": (a+b)*3"
            if (CheckNextToken(Token::kIdent))
            {
                goto errorTag;
            }

            variables.push_back(token.GetText());
            Advance(); // 拿到冒号":"，跳出循环
        }
        
        // 如果不是冒号，报错，如果是冒号，Consume函数会调用Advance
        if (Consume(Token::kColon))
        {
            goto errorTag;
        }
        // TODO: 5、当前token:"(", 剩余字符:"a+b)*3"
    }

    expr = ParseExpr();
    if (CheckNextToken(Token::kEOI))
    {
        goto errorTag;
    }

    if (variables.empty())
    {
        return expr;
    }
    else
    {
        return new WithDeclaration(variables, expr);
    }

errorTag:
    while (token.GetType() != Token::kEOI)
    {
        Advance();
    }

    return nullptr;
}

Expr* Parser::ParseExpr()
{
    Expr* left = ParseTerm();
    while (token.IsOneOf(Token::kPlus, Token::kMinus))
    {
        BinaryOp::Operator op = token.Is(Token::kPlus) ? BinaryOp::kPlus : BinaryOp::kMinus;

        Advance();
        // TODO: 8、当前token:"b", 剩余字符:")*3"
        Expr* right = ParseTerm();
        left = new BinaryOp(op, left, right);
    }

    return left;
}

Expr* Parser::ParseTerm()
{
    Expr* left = ParseFactor();
    while (token.IsOneOf(Token::kStar, Token::kSlash))
    {
        BinaryOp::Operator op = token.Is(Token::kStar) ? BinaryOp::kMultiple : BinaryOp::kDivide;

        Advance();
        // TODO: 11、当前token:"3", 剩余字符:""
        Expr* right = ParseFactor();
        left = new BinaryOp(op, left, right);
    }

    return left;
}

Expr* Parser::ParseFactor()
{
    Expr* expr = nullptr;
    switch (token.GetType())
    {
        case Token::kNumber:
            expr = new Factor(Factor::kNumber, token.GetText());
            Advance();
            // TODO: 12、当前token:KEOI, 剩余字符:""
            break;
        case Token::kIdent:
            expr = new Factor(Factor::kIdent, token.GetText());
            Advance();
            // TODO: 7、当前token:"+", 剩余字符:"b)*3"
            // TODO: 9、当前token:")", 剩余字符:"*3"
            break;
        case Token::kLeftParen:
            Advance();
            // TODO: 6、当前token:"a", 剩余字符:"+b)*3"
            expr = ParseExpr();
            // 如果不是右括号，跳过，如果是右括号，Consume函数会调用Advance
            if (!Consume(Token::kRightParen))
            {
                break;
            }
            // TODO: 10、当前token:"*", 剩余字符:"3"
        default:
            if (!expr)
            {
                AddError();
            }
            while (
                !token.IsOneOf(Token::kRightParen, Token::kStar, Token::kPlus, Token::kMinus, Token::kSlash, Token::kEOI))
            {
                Advance();
            }
            break;
    }

    return expr;
}

void Parser::Codegen()
{
    AST* tree = Parse();
    if (!tree || HasError())
    {
        llvm::errs() << "Syntax errors occured\n";
        return;
    }

    ASTPrinter printer;
    tree->Accept(printer);
}
