*** Settings ***
Library               QWeb
Suite Setup           Open Browser    about:blank    chrome
Suite Teardown        CloseAllBrowsers


*** Test Cases ***
Exercise 2 - Consulting Libraries
    Go To             https://docs.copado.com/articles/\#!copado-robotic-testing-publication/all-qwords
    Log Screenshot
    Go To             https://docs.copado.com/resources/Storage/copado-robotic-testing-publication/CRT%20Site/qwords-reference/current/qwords/_attachments/QWeb.html
    Log Screenshot
    Go To             https://docs.copado.com/resources/Storage/copado-robotic-testing-publication/CRT%20Site/qwords-reference/current/qwords/_attachments/QForce.html
    Log Screenshot
    Go To             https://docs.copado.com/resources/Storage/copado-robotic-testing-publication/CRT%20Site/qwords-reference/current/qwords/_attachments/QVision.html
    Log Screenshot
    Go To             https://docs.copado.com/resources/Storage/copado-robotic-testing-publication/CRT%20Site/qwords-reference/current/qwords/_attachments/QMobile.html
    Log Screenshot
    Go To             https://docs.copado.com/resources/Storage/copado-robotic-testing-publication/CRT%20Site/qwords-reference/current/qwords/_attachments/QS4Hana.html
    Log Screenshot
    Go To             https://docs.copado.com/resources/Storage/copado-robotic-testing-publication/CRT%20Site/qwords-reference/current/qwords/_attachments/QNow.html
    Log Screenshot
    Go To             https://docs.copado.com/resources/Storage/copado-robotic-testing-publication/CRT%20Site/qwords-reference/current/qwords/_attachments/QImage.html
    Log Screenshot
    Go To             https://robotframework.org/?tab\=builtin#resources
    Log Screenshot
    Go To             https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    Log Screenshot
    Go To             https://robotframework.org/robotframework/latest/libraries/Collections.html
    Log Screenshot
    Go To             https://robotframework.org/robotframework/latest/libraries/String.html
    Log Screenshot
    Go To             http://robotframework.org/robotframework/latest/libraries/DateTime.html
    Log Screenshot
    Go To             https://robotframework.org/robotframework/latest/libraries/OperatingSystem.html
    Log Screenshot
    Go To             https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html
    Log Screenshot
    Go To             https://guykisel.github.io/robotframework-faker/
    Log Screenshot
    Sleep             120
    #change1