*** Settings ***
Resource                        ../resources/common.robot
Resource                        ../resources/leads.robot
Library                         DataDriver     reader_class=TestDataApi    name=test-data1.csv   include=alternate CSV    #exclude=tagtoexclude
Library                         FakerLibrary
Suite Setup                     Setup Browser
Test Setup                      Run Keywords                Home                        Unique Test Data
Suite Teardown                  Close All Browser Sessions
Test Template                   Create Verify and Delete Lead End to End

# In this exercise we use the same salesforce scenario built with exercise 6 and 12.

*** Test Cases ***
Exercise 14 - Data Driven Testing - Create Lead using Suite Test Template with ${lead_status} ${last_name} ${company} ${first_name} ${salutation}
    [Tags]                    alternate CSV

*** Keywords ***

Create Verify and Delete Lead End to End
    [Arguments]                 ${lead_status}              ${last_name}                ${company}             ${first_name}               ${salutation}       
    Create Lead                 ${lead_status}              ${last_name}                ${company}             ${salutation}               ${first_name}         
    Verify Lead                 ${lead_status}              ${last_name}                ${company}             ${salutation}               ${first_name}
    Delete Lead                 ${first_name}               ${last_name}

Unique Test Data
    ${Last_Name}=               Last Name
    Set Suite Variable          ${last_name}                ${Last Name}
    ${Company}=                 Company
    Set Suite Variable          ${company}                  ${Company}
    ${First_Name}=              First Name
    Set Suite Variable          ${first_name}               ${First_Name}
