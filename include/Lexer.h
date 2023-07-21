#pragma once

#include "llvm/ADT/StringRef.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Support/raw_ostream.h"

class Token
{
public:

    enum TokenType
    {
        kEOI,         /// 结束
        kUnknown,     /// 未知
        kIdent,       /// 字母
        kNumber,      /// 数字"0~9"
        kComma,       /// 逗号","
        kColon,       /// 冒号":"
        kPlus,        /// 加号"+"
        kMinus,       /// 减号"-"
        kStar,        /// 乘号"*"
        kSlash,       /// 除号"/"
        kLeftParen,   /// 左括号"("
        kRightParen,  /// 右括号")"
        kKeywordWith  /// 关键字"with"
    };

public:

    TokenType GetType() const
    {
        return type;
    }

    void SetType(TokenType inType)
    {
        type = inType;
    }

    llvm::StringRef GetText() const
    {
        return text;
    }

    void SetText(llvm::StringRef inText)
    {
        text = inText;
    }

    bool Is(TokenType inType) const
    {
        return type == inType;
    }

    bool IsOneOf(TokenType type1, TokenType type2) const
    {
        return Is(type1) || Is(type2);
    }

    template<typename... Ts> bool IsOneOf(TokenType type1, TokenType type2, Ts... types) const
    {
        return Is(type1) || IsOneOf(type2, types...);
    }

private:

    TokenType type;
    llvm::StringRef text;
};

class Lexer
{
public:

    Lexer(const llvm::StringRef& Buffer)
    {
        bufferStart = Buffer.begin();
        bufferPtr = bufferStart;
    }

    void GetNext(Token& token);
    void Codegen();

private:

    void InitializeToken(Token& token, const char* tokenEnd, Token::TokenType type);

private:

    const char* bufferStart;
    const char* bufferPtr;
};
