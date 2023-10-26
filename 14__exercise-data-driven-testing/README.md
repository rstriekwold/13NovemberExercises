# Exercise 14 - Data Driven Testing

Welcome to **Exercise 14**. Everything you need to know about data driven testing with Copado Robotic Testing.

# Purpose

The purpose of this exercise is to learn how data driven testing can be applied, applying multiple iterations of test runs resulting in individual test results.

# Prerequisite(s)

- Access to a Copado Robotic Testing Organization is required
- Access to a Project
- Robot created

# Learning Objectives

- Identify a candidate for Data Driven Testing
- Create your Data Driven Test using Test Template
- Prepare your CSV File with Test Data
- Create your Data Driven Test using DataDriver 3rd party library
- Use a template within a test case
- Use an alternately formatted CSV File
- Two options you can use for Individual Test Debugging

# Identify a candidate for Data Driven Testing

1. Create a new empty suite **exercise 14 data driven testing**

2. Create a folder in the root named **14__exercise-data-driven-testing**

3. In folder **14__exercise-data-driven-testing**, create file suitable-candidate-for-data-driven-testing.robot and copy the contents from here [suitable-candidate-for-data-driven-testing.robot](suitable-candidate-for-data-driven-testing.robot)

4. Create a folder in root named **resources**

5. In this folder, create file common.robot and copy the contents from here [common.robot](../resources/common.robot)

# Create your Data Driven Test using Test Template

Let's start with a clearly descriptive data driven tests using Test Data internally within the robot file itself.

1. In folder **14__exercise-data-driven-testing**, create file suite-test-template.robot and copy the contents from here [suite-test-template.robot](suite-test-template.robot)

2. In folder **resources**, create file leads.robot and copy the contents from here [leads.robot](../resources/leads.robot)

3. Open file **suite-test-template.robot** and run the test cases in live testing

# Prepare your CSV File with Test Data

1. In folder **14__exercise-data-driven-testing**, create file test-data.csv and copy the contents from here [test-data.csv](test-data.csv)

# Create your Data Driven Test using DataDriver 3rd party library

1. In folder **14__exercise-data-driven-testing**, create file datadriver-suite-test-template.robot and copy the contents from here [datadriver-suite-test-template.robot](datadriver-suite-test-template.robot)

2. Open file **datadriver-suite-test-template.robot** and run the test cases outside of live testing

# Use a template within a test case

1. In folder **14__exercise-data-driven-testing**, create file test-case-test-template.robot and copy the contents from here [test-case-test-template.robot](test-case-test-template.robot)

2. Open file **datadriver-suite-test-template.robot** and run the test cases outside of live testing

# Use an alternately formatted CSV File

1. In folder **14__exercise-data-driven-testing**, create file datadriver-alternate-csv-format.robot and copy the contents from here [datadriver-alternate-csv-format.robot](datadriver-alternate-csv-format.robot)

2. On your desktop, create a new file Leads.csv and copy the contents from here [Leads.csv](Leads.csv)

3. Navigate to suite **exercise 14 data driven testing** and locate the Test Data section in the top-right of the screen.

4. Click "upload" and navigate through the next few prompts:

    1. Choose your Leads.csv file

    2. Click "Next"

    3. Click "Send"

    4. Click "Close"

5. Under the Test Data section, select **Leads.csv**. Click "Save"

6. Use Advanced Options to set the execution parameter --include for "alternate CSV", then click Run

# Two options you can use for Individual Test Debugging

1. Comment Test Template and Add ***variables***
2. Select Uploaded file and select a row and debug