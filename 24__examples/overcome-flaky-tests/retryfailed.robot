*** Settings ***

Documentation                   New test suite
Resource                        ../../resources/common.robot
Library                         RetryFailed    global_retries=3   keep_retried_tests=False    log_level=None
Test Setup                      Open Browser                about:blank                 chrome
Test Teardown                   Close All Browser Sessions

*** Variables ***
# Only used for simulation purposes
${has_failed}=    ${FALSE}

*** Test Cases ***
Examples - Overcome Flaky Tests - Always Fails with First Try
    Log    First Run    console=True
    Fail    This will fail

Examples - Overcome Flaky Tests - Always Passes after Second Try
    IF    not $has_failed
        Set Suite Variable   ${has_failed}    ${TRUE}
        Log    First Run    console=True
        Fail    This will fail
    END
    Log    Second Run    console=True
    Pass Execution    This will pass