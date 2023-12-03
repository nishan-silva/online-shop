Robot Framework for Rest API Testing
=======================================

Robot Framework is a generic open source test automation framework. In addition to introducing Robot Framework test data syntax, this demo shows how to execute test cases, how generated reports and logs look like, and how to extend the framework with custom test libraries.

Environment Setup
==================

**Install Python:**
    https://www.python.org/downloads/

**Checking python version:**

    Windows: python --version
    Mac: python3 --version

**Download get-pip.py:**

    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py

**Install pip for Python 3:**

    python3 get-pip.py

**Check pip version:**

    pip --version

**Install VS code**

    https://code.visualstudio.com/download

**Install following libraries using CMD**

    pip install robotframework
    pip install requests
    pip install robotframework-requests
    pip install robotframework-jsonlibrary

**Set python environment variable**


**Run testcases**

    robot -A "ArgumentFiles/aws.args" "TestSuites/api.robot"


**Git Command**

    git add .
    git commit -m "readme file edited"
    git push