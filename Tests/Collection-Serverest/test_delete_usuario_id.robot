*** Settings ***
Documentation    Teste para deletar usuário

Resource         ../../Resources/setup_teardown.resource    # robotcode: ignore
Resource         ../../Resources/Collection-Serverest/api_delete_user.resource    # robotcode: ignore

Suite Setup      Cadastro de usuário para testes    # robotcode: ignore

*** Test Cases ***
Scenario 01: Deletar usuário cadastrado
    [Tags]    user_delete
    Deletar usuário por ID    ${ID_USER}    # robotcode: ignore
    Verificar retorno do delete    # robotcode: ignore
