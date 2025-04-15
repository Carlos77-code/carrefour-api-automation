*** Settings ***
Documentation

Resource    ../../Resources/setup_teardown.resource    # robotcode: ignore
Resource    ../../Resources/Collection-Serverest/Api_login.resource


Suite Setup    Cadastro de usuário para testes    # robotcode: ignore

*** Test Cases ***
Scenario 01: Login com sucesso
    [Tags]    login_success
    Realizar login com credenciais válidas    ${EMAIL_TEST}    ${PASSWORD}    # robotcode: ignore
    Validar login com token

Scenario 02: Login com dados inválidos - email inválido
    [Tags]    login_email_invalid
    Realizar login com credenciais inválidas    test123test@qa.com    123    401    # robotcode: ignore
    Validar mensagem e status code email invalido

Scenario 03: Login com campo email vazio
    [Tags]    login_email_empty
    Realizar login com campo email vazio    123    400    # robotcode: ignore
    Validando status code email vazio

Scenario 04: Login com dados inválidos - senha inválido
    [Tags]    login_password_invalid
    Realizar login com credenciais de senha invalidas    ${EMAIL_TEST}    789    401    # robotcode: ignore
    Validar mensagem e status code email invalido

Scenario 05: Login com campo senha vazio
    [Tags]    login_password_empty
    Realizar login com campo senha vazio    ${EMAIL_TEST}    400    # robotcode: ignore
    Validando status code senha vazio