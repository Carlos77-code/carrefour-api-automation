*** Settings ***
Documentation        Here is the step by step for the requests for project.


Resource        ../../Resources/utils.resource

Resource        ../../Resources/Collection-Serverest/api_searc_user.resource
Resource        ../../Resources/setup_teardown.resource    # robotcode: ignore


Suite Setup    Cadastro de usuário para testes    # robotcode: ignore


*** Test Cases ***
Scenario 01: Search user for id
    [Tags]    search_for_id
    Buscar usuário por ID    ${ID_USER}    # robotcode: ignore
    Validar dados retornados do usuário    # robotcode: ignore