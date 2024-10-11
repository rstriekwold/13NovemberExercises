*** Settings ***
Library                       FakerLibrary
Library                       QWeb
Library                       String
Library                       BuiltIn
Library                       DateTime
Suite Setup                   Open Browser              about:blank        chrome
Suite Teardown                Close All Browsers

*** Test Cases ***

Exercise 15 - Generate Random String     
    ${ret}=                  Generate Random String
    ${let}=	Generate Random String	12	[LETTERS]
    ${low}=	Generate Random String	12	[LOWER]
    ${bin}=	Generate Random String	8	01
    ${hex}=	Generate Random String	4	[NUMBERS]abcdef
    ${rnd}=	Generate Random String	5-10	# Generates a string 5 to 10 characters long

Exercise 15 - Catenate Strings
    ${str1}=	Catenate	Hello	world	
    ${str2}=	Catenate	SEPARATOR=---	Hello	world
    ${str3}=	Catenate	SEPARATOR=	Hello	world

Exercise 15 - Log Unique Test Data generated using FakerLibrary
    ${license_plate}=         License Plate
    ${company}=               Company
    ${address}=               Address
    ${timestamp}=             Unix Time

Exercise 15 - Todays Date
    ${date} =            Get Current Date
    ${date_formatted}    Get Current Date           result_format=%m/%d/%Y
    
Exercise 15 - Start and End Date
    ${date} =            Get Current Date
    ${start_date} =      Add Time To Date           ${date}                   2 days      result_format=%m/%d/%Y
    ${end_date} =        Add Time To Date           ${date}                   150 days    result_format=%m/%d/%Y

Exercise 15 - Date plus days
    ${date_formatted}    Get Current Date           result_format=%m/%d/%Y
    ${future_date} =     Add Time To Date           ${date_formatted}         2 days      result_format=%m/%d/%Y    date_format=%m/%d/%Y

Exercise 15 - Date minus days
    ${date_formatted}    Get Current Date           result_format=%m/%d/%Y
    ${past_date} =       Subtract Time From Date    ${date_formatted}         2 days      result_format=%m/%d/%Y    date_format=%m/%d/%Y
