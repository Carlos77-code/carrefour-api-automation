*** Settings ***
Documentation        Here are the commands for project

Resource        ../../Resources/libraries.resource
Resource        ../../Resources/services.resource

*** Variables ***
${PASSWORD}       123
${ADMIN}          true


*** Keywords ***
Create a new user
    ${word_random}=    Generate Random String    length=4    chars=[LETTERS]
    ${EMAIL_TEST}=          Convert To Lower Case     ${word_random}@emailtest.com
    Set Suite Variable    ${EMAIL_TEST}    ${word_random}@emailtest.com    # robotcode: ignore
    ${password}=       Set Variable               123456
    ${name}=           Set Variable               QA Test User
    RETURN    ${EMAIL_TEST}    ${password}    ${name}


Register the user create at the Serverest
    [Arguments]    ${email}    ${status_code_expected}
    ${payload}    Create Dictionary
    ...           nome=Desafio-Deanta
    ...           email=${email}
    ...           password=${PASSWORD}
    ...           administrador=${ADMIN}
    Log    ${payload}

    Create session at the ServeRest

    ${response}    POST usuarios    ${payload}    ${status_code_expected}

    Log    ${response.json()}

    IF    ${response.status_code} == 201
        Set Suite Variable    ${ID_USER}     ${response.json()["_id"]}    # robotcode: ignore
    END
    
    Set Suite Variable    ${RESPOSTA}    ${response.json()}           # robotcode: ignore 
          

Create session at the ServeRest
    ${headers}    Create Dictionary
    ...           accept=application/json
    ...           Content-Type=application/json

    Create Session    alias=ServeRest    url=${BASE_URL}    headers=${headers}    verify=False


Check if the user go register right
    Log    ${RESPOSTA}    # robotcode: ignore
    Dictionary Should Contain Item    ${RESPOSTA}    message   Cadastro realizado com sucesso    # robotcode: ignore
    Dictionary Should Contain Key     ${RESPOSTA}    _id                                         # robotcode: ignore
    

    #################    scenario 2    ##################
Repeat the register user already exists
        Register the user create at the Serverest    ${EMAIL_TEST}    status_code_expected=400    # robotcode: ignore


Check if the API does not allow duplicate registration
    Dictionary Should Contain Item    ${RESPOSTA}    message   Este email já está sendo usado    # robotcode: ignore


    ##################    scenario 3    #################
Check the user register data
    ${check_return}    GET On Session
    ...                alias=ServeRest
    ...                url=/usuarios/${ID_USER}    # robotcode: ignore

    Set Global Variable    ${RESP_CONSULTA}    ${check_return.json()}    # robotcode: ignore

    Log    ${check_return}

Check the return data
    Log    ${RESP_CONSULTA}    # robotcode: ignore
    Dictionary Should Contain Item    ${RESP_CONSULTA}    nome             Desafio-Deanta     # robotcode: ignore
    Dictionary Should Contain Item    ${RESP_CONSULTA}    email            ${EMAIL_TEST}      # robotcode: ignore
    Dictionary Should Contain Item    ${RESP_CONSULTA}    password         123                # robotcode: ignore
    Dictionary Should Contain Item    ${RESP_CONSULTA}    administrador    true               # robotcode: ignore
    Dictionary Should Contain Item    ${RESP_CONSULTA}    _id              ${ID_User}         # robotcode: ignore