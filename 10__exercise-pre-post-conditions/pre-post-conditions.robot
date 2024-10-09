*** Settings ***
Resource                        ../resources/common.robot
Suite Setup                     Setup Browser
Test Setup                      Home
Test Teardown                   Home
Suite Teardown                  Close All Browser Sessions

*** Test Cases ***
Exercise 10 - Using Suite Setup, Test Setup, Test Teardown and Suite Teardown from Settings
    ClickText                   Leads

Exercise 10 - Overridden Test Teardown and Suite Teardown
    [Setup]                     Create Lead
    Home
    LaunchApp                   Sales
    ClickText                   Leads
    VerifyText                  Tina Smith
    VerifyText                  Manager
    VerifyText                  Growmore
    [Teardown]                  Delete Lead

Exercise 10 - Overridden Test Teardown doing nothing
    ClickText                   Leads
    [Teardown]                  NONE

*** Keywords ***

Create Lead
    Launch App                  Sales
    ClickText                   Leads
    VerifyText                  Recently Viewed             timeout=120s

    ClickText                   New                         anchor=Import
    VerifyText                  Lead Information

    UseModal                    On                          # Only find fields from open modal dialog
    Picklist                    Salutation                  Ms.
    TypeText                    First Name                  Tina
    TypeText                    Last Name                   Smith
    Picklist                    Lead Status                 Working
    TypeText                    Phone                       +12234567858449             First Name
    TypeText                    Company                     Growmore                    Last Name
    TypeText                    Title                       Manager                     Address Information
    TypeText                    Email                       tina.smith@gmail.com        Rating
    TypeText                    Website                     https://www.growmore.com/

    ClickText                   Lead Source
    ClickText                   Advertisement
    ClickText                   Save                        partial_match=False
    UseModal                    Off
    Sleep                       2

    ClickText                   Details                     anchor=Activity
    VerifyText                  Ms. Tina Smith              anchor=Details
    VerifyText                  Manager                     anchor=Details
    VerifyText                  +12234567858449             anchor=Lead Status
    VerifyField                 Company                     Growmore
    VerifyField                 Website                     https://www.growmore.com/
    Log Screenshot

Delete Lead
    LaunchApp                   Sales
    ClickText                   Leads
    VerifyText                  Recently Viewed             timeout=120s

    Wait Until Keyword Succeeds                             1 min                       5 sec                  ClickText      Tina Smith
    ClickText                   Delete
    ClickText                   Delete
    ClickText                   Close
    Log Screenshot
