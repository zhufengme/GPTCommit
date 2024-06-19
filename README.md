# GPTCommit - A Script to Automatically Generate Git Commit Messages Using GPT

[中文版](README_zh.md)

GPTCommit is an automated Git commit tool. It uses OpenAI's GPT-4o model to analyze code changes and generate commit messages, simplifying the code commit process.

## Main Features

- Automatically detects uncommitted changes
- Uses GPT-4o model to generate commit messages
- Automatically performs `git add .` and `git commit -m {message}`

## Installation

1. Clone this repository to your local machine:
    ```bash
    git clone https://github.com/zhufengme/GPTCommit
    ```

2. Navigate to the project directory:
    ```bash
    cd GPTCommit
    ```

3. Ensure you have `jq` installed to process JSON data. If not installed, you can use the following command to install it:
    ```bash
    sudo apt-get install jq
    ```

## Configuration

Before running the script, you need to perform some configuration.

1. Open the `gptcommit.sh` file:
    ```bash
    nano gptcommit.sh
    ```

2. Replace `your_openai_api_key_here` with your OpenAI API key in the following line:
    ```bash
    OPENAI_API_KEY="your_openai_api_key_here"
    ```

3. [Optional] Set the proxy you want to use, leave empty to follow curl's default behavior (using the HTTPS_PROXY environment variable or settings in .curlrc):
    ```bash
    CURL_PROXY=""
    ```

4. [Optional] If you need to modify the OpenAI API endpoint, you can edit the following line:
    ```bash
    OPENAI_API_ENDPOINT="https://api.openai.com/v1/chat/completions"
    ```
    You can change this to a different API endpoint as needed.

## Usage

1. Ensure there are uncommitted changes in your Git working directory.

2. Run the script:
    ```bash
    ./gptcommit.sh
    ```

3. The script will automatically perform the following steps:
    - Check the working directory status
    - Get the uncommitted changes
    - Call OpenAI's API to generate commit messages
    - Add changes to the staging area and commit them

## Adding the Script to PATH

To conveniently use the script in any directory, you can add it to your system's PATH:

1. Copy the script to a directory in PATH, such as `/usr/local/bin`:
    ```bash
    sudo cp gptcommit.sh /usr/local/bin/gptcommit
    sudo chmod +x /usr/local/bin/gptcommit
    ```

2. Now you can use the script in any Git repository directory by running:
    ```bash
    gptcommit
    ```

## Notes

- Ensure your OpenAI API key has sufficient quota to handle requests.
- The script assumes you are working within a current Git repository and have the appropriate permissions to perform commit operations.
- Make sure your network connection is stable, especially if you need to access the OpenAI API through a proxy.

## Contributing

Issues and feature requests are welcome! If you want to contribute code, please fork this repository and submit a pull request.

## License

This project is licensed under the GPL.

