*** Settings ***

Resource    ../Resources/Collection-Serverest/api_cadastro_usuario.resource

*** Keywords ***
Cadastro de usuário para testes
    Create a new user
    Register the user create at the Serverest    ${EMAIL_TEST}    status_code_expected=201    # robotcode: ignore