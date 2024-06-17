# GPTCommit 一个使用GPT自动生成Git提交注释的脚本

GPTCommit 是一个自动化的 Git 提交工具。它使用 OpenAI 的 GPT-4 模型分析代码更改并生成提交注释，从而简化了代码提交过程。

## 主要功能

- 自动检测未提交的更改
- 使用 GPT-4 模型生成提交注释
- 自动执行 `git add .` 和 `git commit -m {注释}`

## 安装

1. 克隆本仓库到你的本地机器：
    ```bash
    git clone https://github.com/zhufengme/GPTCommit
    ```

2. 进入项目目录：
    ```bash
    cd GPTCommit
    ```

3. 确保你已安装 `jq`，用于处理 JSON 数据。如果没有安装，可以使用以下命令安装：
    ```bash
    sudo apt-get install jq
    ```

## 配置

在运行脚本之前，你需要设置你的 OpenAI API 密钥。

1. 打开 `auto_commit.sh` 文件：
    ```bash
    nano auto_commit.sh
    ```

2. 将以下行中的 `your_openai_api_key_here` 替换为你的 OpenAI API 密钥：
    ```bash
    OPENAI_API_KEY="your_openai_api_key_here"
    ```

3. [可选] 在以下行中的双引号中设置你要使用的 proxy ，留空则遵循 curl 的默认行为（使用 HTTPS_PROXY 环境变量或 .curlrc 中的设置）
    ```bash
    CURL_PROXY=""
    ```

## 使用

1. 确保你的 Git 工作目录中有未提交的更改。

2. 运行脚本：
    ```bash
    ./auto_commit.sh
    ```

3. 脚本将自动执行以下步骤：
    - 检查工作目录状态
    - 获取未提交的更改
    - 调用 OpenAI 的 API 生成提交注释
    - 添加更改到暂存区并提交

## 注意事项

- 确保你的 OpenAI API 密钥具有足够的配额来处理请求。
- 该脚本假设你已经在当前 Git 仓库中工作，并且有合适的权限执行提交操作。

## 贡献

欢迎提交问题和功能请求！如果你想贡献代码，请 fork 本仓库并提交 pull request。

