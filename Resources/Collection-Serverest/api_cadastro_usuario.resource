*** Settings ***
Documentation        Here are the commands for project

Resource        ../../Resources/libraries.resource

*** Variables ***
${PASSWORD}       123
${ADMIN}          true


*** Keywords ***
Create a new user
    ${word_random}    Generate Random String    length=4    chars=[LETTERS]
    ${word_random}    Convert To Lower Case    ${word_random}
    Set Test Variable    ${EMAIL_TEST}    ${word_random}@emailtest.com    # robotcode: ignore
    Log    ${EMAIL_TEST}                                                  # robotcode: ignore


Register the user create at the Serverest
    [Arguments]    ${email}    ${status_code_expexted}
    ${payload}    Create Dictionary
    ...           nome=Desafio-Deanta
    ...           email=${email}
    ...           password=${PASSWORD}
    ...           administrador=${ADMIN}
    Log    ${payload}

    Create session at the ServeRest

    ${response}    POST On Session
    ...            alias=ServeRest
    ...            url=/usuarios
    ...            json=${payload}
    ...            expected_status=${status_code_expexted}

    Log    ${response.json()}

    IF    ${response.status_code} == 201
        Set Test Variable    ${ID_USER}     ${response.json()["_id"]}    # robotcode: ignore
    END
    
    Set Test Variable    ${RESPOSTA}    ${response.json()}           # robotcode: ignore 
          

Create session at the ServeRest
    ${headers}    Create Dictionary
    ...           accept=application/json
    ...           Content-Type=application/json

    Create Session    alias=ServeRest    url=https://serverest.dev    headers=${headers}    verify=False


Check if the user go register right
    Log    ${RESPOSTA}    # robotcode: ignore
    Dictionary Should Contain Item    ${RESPOSTA}    message   Cadastro realizado com sucesso    # robotcode: ignore
    Dictionary Should Contain Key     ${RESPOSTA}    _id                                         # robotcode: ignore
    

    #################    scenario 2    ##################
Repeat the register user already exists
        Register the user create at the Serverest    ${EMAIL_TEST}    status_code_expexted=400    # robotcode: ignore


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