# Exercise 6 - Salesforce Testing!

Welcome to **Exercise 6**. Let's create our first Salesforce tests!

# Purpose

The purpose of this exercise is to learn how to create and run your first test against Salesforce using CRT.

# Prerequisite(s)

- Access to a Salesforce Trial Org. is required. (exercise 4)
- Access to a Copado Robotic Testing Organization is required
- Access to a Project
- Robot created

# Learning Objectives

- Create your first Salesforce Test
- Login to Salesfore
- Create Test Case Enter a Lead
- Create Test Case Delete a Lead

# Learn how to Create a Test in Salesforce

1. Create a new empty suite **exercise 6 salesforce testing**

2. Create a folder in the root named **06__exercise-salesforce-testing**

3. In this folder, create file salesforce.robot and copy the contents from here [salesforce.robot](salesforce.robot)

4. Create a folder in root named **resources**

5. In this folder, create file common.robot and copy the contents from here [common.robot](../resources/common.robot)

6. Open common.robot inside the folder

7. Update the username variable and login_url variable with your saved username and url (exercise 4)

8. Exit the QEditor

9. Navigate your your robot Settings

10. Add a new variable named **password** and provide your saved password (exercise 4)

11. Go back to the QEditor

12. Click Live Test button displayed just above the test case name **Entering A Lead** to watch lead creation.

13. Click Live Test button displayed just above the test case name **Delete Tina Smith's Lead** to watch lead deletion.