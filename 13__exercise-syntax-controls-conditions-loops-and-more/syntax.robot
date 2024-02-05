*** Settings ***
Documentation       Robot Framework 5 syntax recipes cheat sheet robot.
...                 Demonstrates Robot Framework syntax in a concise format.
Suite Setup         Open Browser    about:blank    chrome
Library    QWeb
Suite Teardown      Log    Suite Teardown!
Test Setup          Log    Test Setup!
Test Teardown       Log    Test Teardown!
Test Timeout        2 minutes


*** Variables ***
${STRING}=                  cat
${NUMBER}=                  ${1}
@{LIST}=                    one    two    three
&{DICTIONARY}=              string=${STRING}    number=${NUMBER}    list=@{LIST}
${ENVIRONMENT_VARIABLE}=    %{PATH=Default value}


*** Test Cases ***
Exercise 13 - Call keywords with a varying number of arguments
    A keyword without arguments
    A keyword with a required argument    Argument
    A keyword with a required argument    argument=Argument
    A keyword with an optional argument
    A keyword with an optional argument    Argument
    A keyword with an optional argument    argument=Argument
    A keyword with any number of arguments
    A keyword with any number of arguments    arg1    arg2    arg3    arg4    arg5
    A keyword with one or more arguments    arg1
    A keyword with one or more arguments    arg1    arg2    arg3

Exercise 13 - Call a keyword that returns a value
    ${value}=    A keyword that returns a value
    Log    ${value}    # Return value

Exercise 13 - Do conditional IF - ELSE IF - ELSE execution
    IF    ${NUMBER} > 1
        Log    Greater than one.
    ELSE IF    "${STRING}" == "dog"
        Log    It's a dog!
    ELSE
        Log    Probably a cat.
    END

Exercise 13 - Loop a list
    Log    ${LIST}    # ['one', 'two', 'three']
    FOR    ${item}    IN    @{LIST}
        Log    ${item}    # one, two, three
    END
    FOR    ${item}    IN    one    two    three
        Log    ${item}    # one, two, three
    END

Exercise 13 - Loop a dictionary
    Log    ${DICTIONARY}
    # {'string': 'cat', 'number': 1, 'list': ['one', 'two', 'three']}
    FOR    ${key_value_tuple}    IN    &{DICTIONARY}
        Log    ${key_value_tuple}
        # ('string', 'cat'), ('number', 1), ('list', ['one', 'two', 'three'])
    END
    FOR    ${key}    IN    @{DICTIONARY}
        Log    ${key}=${DICTIONARY}[${key}]
        # string=cat, number=1, list=['one', 'two', 'three']
    END

Exercise 13 - Loop a range from 0 to end index
    FOR    ${index}    IN RANGE    10
        Log    ${index}    # 0-9
    END

Exercise 13 - Loop a range from start to end index
    FOR    ${index}    IN RANGE    1    10
        Log    ${index}    # 1-9
    END

Exercise 13 - Loop a range from start to end index with steps
    FOR    ${index}    IN RANGE    0    10    2
        Log    ${index}    # 0, 2, 4, 6, 8
    END

Exercise 13 - Nest loops
    @{alphabets}=    Create List    a    b    c
    Log    ${alphabets}    # ['a', 'b', 'c']
    @{numbers}=    Create List    ${1}    ${2}    ${3}
    Log    ${numbers}    # [1, 2, 3]
    FOR    ${alphabet}    IN    @{alphabets}
        FOR    ${number}    IN    @{numbers}
            Log    ${alphabet}${number}
            # a1, a2, a3, b1, b2, b3, c1, c2, c3
        END
    END

Exercise 13 - Exit a loop on condition
    FOR    ${i}    IN RANGE    5
        IF    ${i} == 2    BREAK
        Log    ${i}    # 0, 1
    END

Exercise 13 - Continue a loop from the next iteration on condition
    FOR    ${i}    IN RANGE    3
        IF    ${i} == 1    CONTINUE
        Log    ${i}    # 0, 2
    END

Exercise 13 - Create a scalar variable
    ${animal}=    Set Variable    dog
    Log    ${animal}    # dog
    Log    ${animal}[0]    # d
    Log    ${animal}[-1]    # g

Exercise 13 - Create a number variable
    ${Ï€}=    Set Variable    ${3.14}
    Log    ${Ï€}    # 3.14

Exercise 13 - Create a list variable
    @{animals}=    Create List    dog    cat    bear
    Log    ${animals}    # ['dog', 'cat', 'bear']
    Log    ${animals}[0]    # dog
    Log    ${animals}[-1]    # bear

Exercise 13 - Create a dictionary variable
    &{dictionary}=    Create Dictionary    key1=value1    key2=value2
    Log    ${dictionary}    # {'key1': 'value1', 'key2': 'value2'}
    Log    ${dictionary}[key1]    # value1
    Log    ${dictionary.key2}    # value2

Exercise 13 - Access the items in a sequence (list, string)
    ${string}=    Set Variable    Hello world!
    Log    ${string}[0]    # H
    Log    ${string}[:5]    # Hello
    Log    ${string}[6:]    # world!
    Log    ${string}[-1]    # !
    @{list}=    Create List    one    two    three    four    five
    Log    ${list}    # ['one', 'two', 'three', 'four', 'five']
    Log    ${list}[0:6:2]    # ['one', 'three', 'five']

Exercise 13 - Split arguments to multiple lines
    A keyword with any number of arguments
    ...    arg1
    ...    arg2
    ...    arg3

Exercise 13 - Log available variables
    Log Variables
    # ${/} = /
    # &{DICTIONARY} = { string=cat | number=1 | list=['one', 'two', 'three'] }
    # ${OUTPUT_DIR} = /Users/<username>/...
    # ...

Exercise 13 - Evaluate Python expressions
    ${path}=    Evaluate    os.environ.get("PATH")
    ${path}=    Set Variable    ${{os.environ.get("PATH")}}

Exercise 13 - Use special variables
    Log    ${EMPTY}    # Like the ${SPACE}, but without the space.
    Log    ${False}    # Boolean False.
    Log    ${None}    # Python None
    Log    ${null}    # Java null.
    Log    ${SPACE}    # ASCII space (\x20).
    Log    ${SPACE * 4}    # Four spaces.
    Log    "${SPACE}"    # Quoted space (" ").
    Log    ${True}    # Boolean True.

Exercise 13 - TRY / EXCEPT: Catch any exception
    TRY
        Fail
    EXCEPT
        Log    EXCEPT with no arguments catches any exception.
    END

Exercise 13 - TRY / EXCEPT: Catch an exception by exact message
    TRY
        Fail    Error message
    EXCEPT    Error message
        Log    Catches only "Error message" exceptions.
        Log    Enables error-specific exception handling.
    END

Exercise 13 - TRY / EXCEPT: Multiple EXCEPT statements
    TRY
        Fail    Error message
    EXCEPT    Another error message
        Log    Catches only "Another error message" exceptions.
    EXCEPT    Error message
        Log    Catches the "Error message" exception.
    END

Exercise 13 - TRY / EXCEPT: Multiple messages in EXCEPT statement
    TRY
        Fail    CCC
    EXCEPT    AAA    BBB    CCC
        Log    Catches any "AAA", "BBB", or "CCC" exception.
    END

Exercise 13 - TRY / EXCEPT: Catch a specific exception, or an unexpected exception
    TRY
        Fail    Error message
    EXCEPT    Another message
        Log    Catches only "Another message" exceptions.
    EXCEPT
        Log    Catches any exception.
        Log    Useful for handling unexpected exceptions.
    END

Exercise 13 - TRY / EXCEPT: Catch exceptions where the message starts with
    TRY
        Fail    A long error message with lots of details
    EXCEPT    A long error message    type=start
        Log    Matches the start of an error message.
    END

Exercise 13 - TRY / EXCEPT: Capture the error message
    TRY
        Fail    Goodbye, world!
    EXCEPT    AS    ${error_message}
        Log    ${error_message}    # Goodbye, world!
    END

Exercise 13 - TRY / EXCEPT: Using ELSE when no exceptions occured
    TRY
        Log    All good!
    EXCEPT    Error message
        Log    An error occured.
    ELSE
        Log    No error occured.
    END

Exercise 13 - TRY / EXCEPT / FINALLY: Always execute code no matter if exceptions or not
    TRY
        Log    All good!
    FINALLY
        Log    FINALLY is always executed.
    END
    TRY
        Fail    Catastrophic failure!
    EXCEPT
        Log    Catches any exception.
    FINALLY
        Log    FINALLY is always executed.
    END

Exercise 13 - TRY / EXCEPT / ELSE / FINALLY: All together!
    TRY
        Fail    Error message
    EXCEPT
        Log    Executed if any exception occurs.
    ELSE
        Log    Executed if no exceptions occur.
    FINALLY
        Log    FINALLY is always executed.
    END

Exercise 13 - TRY / EXCEPT: Glob pattern matching
    TRY
        Fail    My error: 99 occured
    EXCEPT    My error: *    type=glob
        Log    Catches by glob pattern matching.
    END

Exercise 13 - TRY / EXCEPT: Regular expression matching
    TRY
        Fail    error 99 occured
    EXCEPT    [Ee]rror \\d+ occured    type=regexp
        Log    Catches by regular expression pattern matching.
    END

Exercise 13 - WHILE: Loop while the default limit (10000) is hit
    TRY
        WHILE    True
            Log    Executed until the default loop limit (10000) is hit.
        END
    EXCEPT    WHILE loop was aborted    type=start
        Log    The loop did not finish within the limit.
    END

Exercise 13 - WHILE: Loop while the given limit is hit
    TRY
        WHILE    True    limit=10
            Log    Executed until the given loop limit (10) is hit.
        END
    EXCEPT    WHILE loop was aborted    type=start
        Log    The loop did not finish within the limit.
    END

Exercise 13 - WHILE: Loop while condition evaluates to True
    ${x}=    Set Variable    ${0}
    WHILE    ${x} < 3
        Log    Executed as long as the condition is True.
        ${x}=    Evaluate    ${x} + 1
    END

Exercise 13 - WHILE: Skip a loop iteration with CONTINUE
    ${x}=    Set Variable    ${0}
    WHILE    ${x} < 3
        ${x}=    Evaluate    ${x} + 1
        #    Skip this iteration.
        IF    ${x} == 2    CONTINUE
        Log   x = ${x}    # x = 1, x = 3
    END

Exercise 13 - WHILE: Exit loop with BREAK
    WHILE    True
        BREAK
        Log    This will not be logged.
    END


*** Keywords ***
A keyword without arguments
    Log    No arguments.

A keyword with a required argument
    [Arguments]    ${argument}
    Log    Required argument: ${argument}

A keyword with an optional argument
    [Arguments]    ${argument}=Default value
    Log    Optional argument: ${argument}

A keyword with any number of arguments
    [Arguments]    @{varargs}
    Log    Any number of arguments: @{varargs}

A keyword with one or more arguments
    [Arguments]    ${argument}    @{varargs}
    Log    One or more arguments: ${argument} @{varargs}

A keyword that returns a value
    RETURN    Return value

RETURN: Return a value from a keyword
    IF    True    RETURN    It is true!    ELSE    RETURN    It is not true!

RETURN: Return without a value
    IF    True    RETURN
    Log    This will not be logged.

A keyword with documentation
    [Documentation]    This is keyword documentation.
    No Operation