# GPTCommit - 使用 GPT 自动生成 Git 提交注释的脚本

GPTCommit 是一个自动化的 Git 提交工具。它使用 OpenAI 的 GPT-4o 模型分析代码更改并生成提交注释，从而简化了代码提交过程。

## 主要功能

- 自动检测未提交的更改
- 使用 GPT-4o 模型生成提交注释
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

在运行脚本之前，你需要进行一些配置。

1. 打开 `auto_commit.sh` 文件：
    ```bash
    nano auto_commit.sh
    ```

2. 将以下行中的 `your_openai_api_key_here` 替换为你的 OpenAI API 密钥：
    ```bash
    OPENAI_API_KEY="your_openai_api_key_here"
    ```

3. [可选] 设置你要使用的代理（proxy），留空则遵循 curl 的默认行为（使用 HTTPS_PROXY 环境变量或 .curlrc 中的设置）：
    ```bash
    CURL_PROXY=""
    ```

4. [可选] 如果需要修改 OpenAI API endpoint，可以编辑以下行：
    ```bash
    OPENAI_API_ENDPOINT="https://api.openai.com/v1/chat/completions"
    ```
    你可以根据需要将其更改为不同的 API endpoint。

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

## 将脚本添加到 PATH

为了在任何目录中都能方便地使用该脚本，你可以将脚本添加到系统的 PATH 路径中：

1. 将脚本复制到一个在 PATH 中的目录，例如 `/usr/local/bin`：
    ```bash
    sudo cp auto_commit.sh /usr/local/bin/gptcommit
    sudo chmod +x /usr/local/bin/gptcommit
    ```

2. 现在你可以在任何 Git 仓库目录中通过运行以下命令来使用脚本：
    ```bash
    gptcommit
    ```

## 注意事项

- 确保你的 OpenAI API 密钥具有足够的配额来处理请求。
- 该脚本假设你已经在当前 Git 仓库中工作，并且有合适的权限执行提交操作。
- 请确保你的网络连接稳定，特别是在需要通过代理访问 OpenAI API 的情况下。

## 贡献

欢迎提交问题和功能请求！如果你想贡献代码，请 fork 本仓库并提交 pull request。

## 许可

本项目遵循 GPL 许可。