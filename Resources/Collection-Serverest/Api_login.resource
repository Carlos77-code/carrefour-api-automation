*** Settings ***
Documentation

Resource    ../../Resources/services.resource

*** Keywords ***
Perform login with valid credentials
    [Arguments]    ${email}    ${password}
    ${payload}=    Create Dictionary
    ...         email=${email}
    ...         password=${password}

    ${response}=    POST On Session
    ...             alias=ServeRest
    ...             url=/login
    ...             json=${payload}
    ...             headers=${HEADERS}

    Set Test Variable    ${RESP_LOGIN}    ${response.json()}    # robotcode: ignore
    Set Test Variable    ${STATUS_LOGIN}  ${response.status_code}    # robotcode: ignore
    Log    ${RESP_LOGIN}    # robotcode: ignore

Validate login with token
    Should Be Equal As Numbers    ${STATUS_LOGIN}    200    # robotcode: ignore
    Dictionary Should Contain Key    ${RESP_LOGIN}    authorization    # robotcode: ignore


    ################    Scenario 2    ############################
Perform login with invalid credentials
    [Arguments]    ${email}    ${password}    ${status_code_expected}
    ${payload}=    Create Dictionary
    ...         email=test123test@qa.com
    ...         password=${password}

    ${response}=    POST On Session
    ...             alias=ServeRest
    ...             url=/login
    ...             json=${payload}
    ...             headers=${HEADERS}
    ...             expected_status=any

    Set Test Variable    ${return_message}    ${response.json()}    # robotcode: ignore
    Should Be Equal As Integers    ${response.status_code}    ${status_code_expected}    # robotcode: ignore
    
    Set Suite Variable    ${RESP_LOGIN}    ${response.json()}    # robotcode: ignore
    
    Log    ${RESP_LOGIN}    # robotcode: ignore
    Log    ${status_code_expected}

Validate message and status code for invalid email
    Log    ${return_message}    # robotcode: ignore
    Dictionary Should Contain Item    ${return_message}    message    Email e/ou senha inválidos    # robotcode: ignore


    ################    Scenario 3    ############################
Perform login with empty email field
    [Arguments]    ${password}    ${status_code_expected}
    ${payload}=    Create Dictionary
    ...            email=
    ...            password=${password}

    ${response}=    POST On Session
    ...             alias=ServeRest
    ...             url=/login
    ...             json=${payload}
    ...             headers=${HEADERS}
    ...             expected_status=any

    Set Test Variable    ${return_message}    ${response.json()}    # robotcode: ignore
    Should Be Equal As Integers    ${response.status_code}    ${status_code_expected}    # robotcode: ignore

    Log    ${status_code_expected}

Validate status code for empty email
    Log    ${return_message}    # robotcode: ignore
    Dictionary Should Contain Item    ${return_message}    email    email não pode ficar em branco    # robotcode: ignore


    ################    Scenario 4    ############################
Perform login with invalid password credentials
    [Arguments]    ${email}    ${password}    ${status_code_expected}
    ${payload}=    Create Dictionary
    ...            email=${email}
    ...            password=${password}

    ${response}=    POST On Session
    ...             alias=ServeRest
    ...             url=/login
    ...             json=${payload}
    ...             headers=${HEADERS}
    ...             expected_status=any

    Set Test Variable    ${return_message}    ${response.json()}    # robotcode: ignore
    Should Be Equal As Integers    ${response.status_code}    ${status_code_expected}    # robotcode: ignore
    
    Set Suite Variable    ${RESP_LOGIN}    ${response.json()}    # robotcode: ignore
    
    Log    ${RESP_LOGIN}    # robotcode: ignore
    Log    ${status_code_expected}

Validate message and status code for invalid password
    Log    ${return_message}    # robotcode: ignore
    Dictionary Should Contain Item    ${return_message}    message    Email e/ou senha inválidos    # robotcode: ignore


    ################    Scenario 5    ############################
Perform login with empty password field
    [Arguments]    ${email}    ${status_code_expected}
    ${payload}=    Create Dictionary
    ...            email=${email}
    ...            password=

    ${response}=    POST On Session
    ...             alias=ServeRest
    ...             url=/login
    ...             json=${payload}
    ...             headers=${HEADERS}
    ...             expected_status=any

    Set Test Variable    ${return_message}    ${response.json()}    # robotcode: ignore
    Should Be Equal As Integers    ${response.status_code}    ${status_code_expected}    # robotcode: ignore

    Log    ${status_code_expected}

Validate status code for empty password
    Log    ${return_message}    # robotcode: ignore
    Dictionary Should Contain Item    ${return_message}    password    password não pode ficar em branco    # robotcode: ignore