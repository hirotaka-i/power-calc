# Introduction

This repository provides a structured template for starting a new analytical project. It is designed with the following priorities in mind:

1. **Reproducibility**: Ensure that analyses are easily reproducible with a clear folder structure and environmental setup guidelines.
2. **Security**: Prevent sensitive information, such as data, API keys, and passwords, from being uploaded to GitHub.

## Install and Set Up the GitHub Connection

To start a new repository based on this template:

```bash
git clone https://github.com/hirotaka-i/new_analysis.git # Clone this template repo
rm -rf .git # Remove the existing Git history
git init # Initialize a new Git repository
git remote add origin <your remote repository> # Connect to your new remote repository
git add .
git commit -m 'first commit'
git branch -M main
git push -u origin main
```

Now, modify the folder name and update the README.md file to personalize it for your project.

## Environment Setup

For Python projects, the recommended way to manage the environment is to use Python’s built-in `venv` module. The following steps guide you through setting up your environment based on specified parameters like Python version and environment management tool:

```bash
# Inside the project folder
python3 -m venv .venv 
source .venv/bin/activate # For macOS/Linux
python -m pip install --upgrade pip
python -m pip install -r requirements.txt # please modify requirements.txt to include the necessary packages
```

To install new packages and update your environment:

```bash
pip install <package_name>
pip freeze > requirements.txt # Update dependencies in requirements.txt
```

To deactivate the virtual environment:

```bash
deactivate
```

The installed packages are listed in the `requirements.txt` file, which simplifies dependency management. If you have `pyenv`, you can specify different Python versions for the virtual environment:

```bash
python3.9 -m venv .venv
```

## Folder Structure

The recommended folder structure is as follows:

```
new_analysis
├── README.md
├── code                 # Code snippets and scripts
│   ├── test.py
│   ├── test.r
│   ├── main.sh          # Shell script to run the main analysis
├── data                 # Input data (gitignored)
│   ├── testdata.csv
├── priv                 # Private information (gitignored)
│   ├── exports.sh       # Script to export environment variables
│   ├── private.txt      # Sensitive information, e.g., API keys
├── report               # Analysis outputs (figures, summaries)
│   └── report.txt
├── temp                 # Temporary files (gitignored)
│   ├── temp1.txt
├── requirements.txt
└── .gitignore
```

Once the `venv` is created, a `.venv` folder will also be generated and should remain gitignored.

## Security

To safeguard sensitive information, the `data`, `priv`, and `temp` folders are gitignored by default:

- The **`data`** folder is for input data.
- The **`priv`** folder stores private information such as API keys and passwords.
- The **`temp`** folder holds temporary files generated during analysis.

**Note**: Ensure that sensitive information is never stored in the `report` folder or any other tracked location.


# Larger project template with cookiecutter
There is a very well organized tempplate for this: [cookiecutter data science](https://drivendata.github.io/cookiecutter-data-science/). They are well-thought of, and have many handy tricks inside and the documentation is helpful. From my perspective, the major differences are 

1. **Extented environment setup**: Combined with the more comprehensive environmental management tools such as virtualenv, conda etc, the cookiecutter provides a more robust environment setup. They even provide the Makefile to manage the environment.
2. **Ease of reusing the codes**: The module folder is structured so that the funtions could be installed as a package. You can use these functions in the `notebook` as you go. Also you can pip install these functions in a different project. (e.g. `pip install git+<github repo>`)
3. **More organized**: The folder structure is more suitable for the larger development and collaborations. Documentations and detailed data subfolders are provided.



## Install cookiecutter
```
pip install cookiecutter-data-science
```
## Create a new project
In the parent folder, run the following command
```
ccdss
```
Then you will be asked to provide the project name, author, etc. and this will generate the project folder with the necessary files and folders.

The default folder structure is well thought and organized. I highly recommend reading the [documentation](https://drivendata.github.io/cookiecutter-data-science/). Especially the landing part (Home) and the Opinions part of the documentation. These are very useful to understand the ideas for the robust data analysis.


## Set up the python environment
Having the same envirioment is important for the reproducibility of the analysis. The following is the command to set up the python environment according to the parameters you provided - the python version and the environment management tool
```
cd <project folder>
make create_environment
```

## Install requirement packages

```
make requirements
```
The above will make sure the requirements will be installed in the environment you created. If you install a new package, make sure to update the requirements.txt file by running the following command. Your module will be installed in the environment as editable mode. 
```
pip install <package name> # install the package
pip freeze > requirements.txt # update the file
```

