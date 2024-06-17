#!/bin/bash

# 设置你的 OpenAI API 密钥
OPENAI_API_KEY="your_openai_api_key_here"
# 设置你的 Proxy，默认使用HTTPS_PROXY环境变量
CURL_PROXY=""

if "x$CURL_PROXY" = "x" ; then
    CURL_PROXY_OPT=""
else
    CURL_PROXY_OPT=$(--proxy "$CURL_PROXY")
fi

# 检查工作目录状态
echo "检查工作目录状态..."
git status

# 获取工作目录和暂存区之间的差异
WORKING_DIFF=$(git diff)
# 获取暂存区和HEAD之间的差异
STAGED_DIFF=$(git diff --cached)

# 合并差异
DIFF="${WORKING_DIFF}${STAGED_DIFF}"

# 如果没有差异，退出
if [ -z "$DIFF" ]; then
    echo "没有发现差异。"
    exit 0
fi

# 调用 OpenAI 的 API 来生成提交注释
generate_commit_message() {
    RESPONSE=$(jq -n --arg diff "$DIFF" '{
        model: "gpt-4o",
        messages: [
            {
                role: "user",
                content: "分析以下代码更改并生成一个简洁的提交注释，请用中英双语提供，只给出文本文字：\n\n\($diff)\n\nCommit message:"
            }
        ],
        max_tokens: 100,
        temperature: 0.7
    }' | curl $CURL_PROXY_OPT --connect-timeout 5 -s https://api.openai.com/v1/chat/completions \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $OPENAI_API_KEY" \
    -d @-)

    echo "$RESPONSE" | jq -r '.choices[0].message.content' | sed 's/^"\(.*\)"$/\1/'
}

# 获取生成的提交注释
COMMIT_MESSAGE=$(generate_commit_message)

# 如果没有生成注释，退出
if [ -z "$COMMIT_MESSAGE" ]; then
    echo "无法生成提交注释。"
    exit 1
fi

# 添加更改到暂存区
git add .

# 提交更改
git commit -m "$COMMIT_MESSAGE"

echo "提交完成，注释为: "
echo " "
echo "$COMMIT_MESSAGE"
