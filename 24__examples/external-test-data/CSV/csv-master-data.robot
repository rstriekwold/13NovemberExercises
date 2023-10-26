*** Settings ***
Library                Collections
Library                QWeb
Library                CSVLibrary
Suite Setup            Open Browser                about:blank                 chrome
Suite Teardown         Close All Browsers

*** Test Cases ***
Examples - External Test Data - CSV - Read CSV File by Column and Value TC01
    @{dict}=           read csv file to associative                            ${CURDIR}${/}..${/}..${/}..${/}files${/}data.csv    delimiter=;
    ${index}=          Get Test Case Data Index From Dictionary By Column                @{dict}       columnName=column1         testCaseNumber=TC01
    Log                ${dict[${${index}}]}[column1]
    Log                ${dict[${${index}}]}[column2]
    Log                ${dict[${${index}}]}[column2]
    Log To Console     ${dict[${${index}}]}[column1]
    Log To Console     ${dict[${${index}}]}[column2]
    Log To Console     ${dict[${${index}}]}[column3]


Examples - External Test Data - CSV - Read CSV File by Column and Value TC02
    @{dict}=           read csv file to associative                            ${CURDIR}${/}..${/}..${/}..${/}files${/}data.csv    delimiter=;
    ${index}=          Get Test Case Data Index From Dictionary By Column               @{dict}        columnName=column1        testCaseNumber=TC02
    Log                ${dict[${${index}}]}[column1]
    Log                ${dict[${${index}}]}[column2]
    Log                ${dict[${${index}}]}[column2]
    Log To Console     ${dict[${${index}}]}[column1]
    Log To Console     ${dict[${${index}}]}[column2]
    Log To Console     ${dict[${${index}}]}[column3]


Examples - External Test Data - CSV - Read CSV File by Column and Value TC03
    @{dict}=           read csv file to associative                            ${CURDIR}${/}..${/}..${/}..${/}files${/}data.csv    delimiter=;
    ${index}=          Get Test Case Data Index From Dictionary By Column                @{dict}        columnName=column1        testCaseNumber=TC03
    Log                ${dict[${${index}}]}[column1]
    Log                ${dict[${${index}}]}[column2]
    Log                ${dict[${${index}}]}[column2]
    Log To Console     ${dict[${${index}}]}[column1]
    Log To Console     ${dict[${${index}}]}[column2]
    Log To Console     ${dict[${${index}}]}[column3]


Examples - External Test Data - CSV - Read CSV File by Column and Value TC04
    @{dict}=           read csv file to associative                            ${CURDIR}${/}..${/}..${/}..${/}files${/}data.csv    delimiter=;
    ${index}=          Get Test Case Data Index From Dictionary By Column                @{dict}        columnName=column1        testCaseNumber=TC04
    Log                ${dict[${${index}}]}[column1]
    Log                ${dict[${${index}}]}[column2]
    Log                ${dict[${${index}}]}[column2]
    Log To Console     ${dict[${${index}}]}[column1]
    Log To Console     ${dict[${${index}}]}[column2]
    Log To Console     ${dict[${${index}}]}[column3]



*** Keywords ***

Get Test Case Data Index From Dictionary By Column
    [Documentation]    Loops through dictionary to find corresponding data with test case number, for that we need to identify the index
    [Arguments]        @{Dict}                     ${columnName}    ${testCaseNumber}
    ${COUNTER}=        Set Variable                0
    ${INDEX}=          Set Variable                0
    ${TESTCASE}=       Set Variable                ${testCaseNumber}
    FOR                ${key_value_tuple}          IN                          @{dict}
        IF             '${dict[${COUNTER}]}[${columnName}]' == '${TESTCASE}'
            ${INDEX}=                              Set Variable                ${COUNTER}
        END
        # Log to console                           ${INDEX}
        ${COUNTER}=    Evaluate                    ${COUNTER} + 1
    END
    [Return]           ${INDEX}

Ge

Get Data as Suite Variables
    [Arguments]                 ${debugTestCaseNumber}
    @{dict}=                    read csv file to associative                            data.csv                    delimiter=;
    ${index}=                   Get Test Case Data Index From Dictionary By Column                @{dict}                     testCaseNumber=${debugTestCaseNumber}
    FOR                         ${key}                      IN                          ${dict[${${index}}]}
        @{columns} =            Get Dictionary Keys         ${key}                      sort_keys=False
        FOR                     ${column}                   IN                          @{columns}
            ${value} =          Get From Dictionary         ${key}                      ${column}
            Set Suite Variable                              ${column}                   ${value}
            Log to Console      suite var ${column} set with ${value}
        END
    END