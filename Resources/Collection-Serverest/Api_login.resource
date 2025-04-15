*** Settings ***
Documentation

Resource    ../../Resources/services.resource

*** Keywords ***
Realizar login com credenciais válidas
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

Validar login com token
    Should Be Equal As Numbers    ${STATUS_LOGIN}    200    # robotcode: ignore
    Dictionary Should Contain Key    ${RESP_LOGIN}    authorization    # robotcode: ignore


    ################    Scenario 2    ############################
Realizar login com credenciais inválidas
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

Validar mensagem e status code email invalido
    Log    ${return_message}    # robotcode: ignore
    Dictionary Should Contain Item    ${return_message}    message    Email e/ou senha inválidos    # robotcode: ignore


    ################    Scenario 3    ############################
Realizar login com campo email vazio
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

Validando status code email vazio
    Log    ${return_message}    # robotcode: ignore
    Dictionary Should Contain Item    ${return_message}    email    email não pode ficar em branco    # robotcode: ignore


    ################    Scenario 4    ############################
Realizar login com credenciais de senha invalidas
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


    ################    Scenario 5    ############################
Realizar login com campo senha vazio
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

Validando status code senha vazio
    Log    ${return_message}    # robotcode: ignore
    Dictionary Should Contain Item    ${return_message}    password    password não pode ficar em branco    # robotcode: ignore