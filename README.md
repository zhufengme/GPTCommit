# GPTCommit - A Script to Automatically Generate Git Commit Messages Using GPT

[中文版](README_zh.md)

GPTCommit is an automated Git commit tool. It leverages OpenAI's GPT-4o model to analyze code changes and generate commit messages, simplifying the code submission process.

## Key Features

- Automatically detects uncommitted changes
- Generates commit messages using the GPT-4o model
- Automatically executes `git add .` and `git commit -m {message}`

## Installation

1. Clone this repository to your local machine:
    ```bash
    git clone https://github.com/zhufengme/GPTCommit
    ```

2. Navigate to the project directory:
    ```bash
    cd GPTCommit
    ```

3. Ensure you have `jq` installed to handle JSON data. If not, you can install it using the following command:
    ```bash
    sudo apt-get install jq
    ```

## Configuration

Before running the script, you need to configure a few things.

1. Open the `gptcommit.sh` file:
    ```bash
    nano gptcommit.sh
    ```

2. Replace `your_openai_api_key_here` in the following line with your OpenAI API key:
    ```bash
    OPENAI_API_KEY="your_openai_api_key_here"
    ```

3. [Optional] Set the proxy you want to use. Leave it empty to follow curl's default behavior (using the HTTPS_PROXY environment variable or settings in .curlrc):
    ```bash
    CURL_PROXY=""
    ```

4. [Optional] If you need to modify the OpenAI API endpoint, you can edit the following line:
    ```bash
    OPENAI_API_ENDPOINT="https://api.openai.com/v1/chat/completions"
    ```
    You can change it to a different API endpoint as needed.

5. [Optional] The default commit message is generated in English. You can edit the following line to change the default language:
    ```bash
    LANGUAGES="en"
    ```
    You can change it to a different language, such as `zh` for Chinese.

## Usage

1. Ensure there are uncommitted changes in your Git working directory.

2. Run the script:
    ```bash
    ./gptcommit.sh
    ```

3. The script will automatically perform the following steps:
    - Check the working directory status
    - Retrieve uncommitted changes
    - Call OpenAI's API to generate a commit message
    - Add changes to the staging area and commit

## Optional Command Line Parameters

An optional command line parameter `--lang` is provided to temporarily specify the language of the generated commit message. For example:

```bash
./gptcommit.sh --lang=zh
```
This command generates the commit message in Chinese.

```bash
./gptcommit.sh --lang=zh,en
```
This command generates the commit message in both Chinese and English.

## Adding the Script to PATH

To conveniently use the script from any directory, you can add it to the system PATH:

1. Copy the script to a directory in your PATH, such as `/usr/local/bin`:
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
- The script assumes you are working within a current Git repository and have appropriate permissions to perform commit operations.
- Ensure your network connection is stable, especially if you need to access the OpenAI API via a proxy.

## Contributing

Issues and feature requests are welcome! If you want to contribute code, please fork this repository and submit a pull request.

## License

This project is licensed under the GPL.
