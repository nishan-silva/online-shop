# Robot Framework for Rest API and Frontend Testing

Robot Framework is a generic open source test automation framework. In addition to introducing Robot Framework test data syntax, this demo shows how to execute test cases, how generated reports and logs look like, and how to extend the framework with custom test libraries.

# Environment Setup

**Installing Python:**

    https://www.python.org/downloads/

**Checking python version:**

    Windows: python --version
    Mac: python3 --version

**Downloading get-pip.py:**

    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py

**Installing pip for Python 3:**

    python3 get-pip.py

**Checking pip version:**

    pip --version

**Installing VS code**

    https://code.visualstudio.com/download

**Installing the below libraries using CMD**

    pip install robotframework
    pip install requests
    pip install robotframework-requests
    pip install robotframework-jsonlibrary
    Library    SeleniumLibrary

**Setting python environment variable**

**Running testcases**

    robot -A "ArgumentFiles/aws.args" "TestSuites/API_Testcases.robot"

**Git commands**

    git add .
    git commit -m "readme file edited"
    git push
