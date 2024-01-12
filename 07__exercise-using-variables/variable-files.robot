*** Settings ***
Variables    PythonVariables.py
Variables    YamlVariables.yaml
Variables    DynamicVariables.py

*** Test Cases ***
Exercise 7 - Variable Files Access Python Variables
    Log   ${TestEnv.ip}
    Log    ${TestEnv.roles}
    Log Many   @{TestEnv.roles}
    Log    ${my_var}
    Log Many   @{my_list}
    Log Many   &{my_dict}
    FOR    ${item}    IN    @{my_list}
        Log    ${item}
    END

Exercise 7 - Variable Files Access Yaml Variables
    Log        ${base_url}
    Log Many   @{yaml_list}
    Log        ${yaml_dict}
    Log        ${yaml_dict}[key_1]

Exercise 7 - Variable Files Access Dynamic Variables
    Log   ${RANDOM_INT}
    Log   ${CURRENT_TIME}
    Log   ${AFTERNOON}
    Log   ${AREA1}
    Log   ${AREA2}

Exercise 7 - Variable Files Use variable file with argument value dev
    Import Variables	${CURDIR}/EnvVariables.py    dev
    Log            ${scalar}
    Log            ${list}
    ${the_var}=    Get Variable Value    ${extra}
    IF    "${the_var}" != "None"
        Log            ${extra}
    END

Exercise 7 - Variable Files Use variable file with argument value uat
    Import Variables	${CURDIR}/EnvVariables.py    uat
    Log            ${scalar}
    Log            ${list}
    ${the_var}=    Get Variable Value    ${extra}
    IF    "${the_var}" != "None"
        Log            ${extra}
    END