*** Settings ***
Documentation    Teste para deletar usuário

Resource         ../../Resources/setup_teardown.resource    # robotcode: ignore
Resource         ../../Resources/Collection-Serverest/api_delete_user.resource    # robotcode: ignore

Suite Setup      User registration for testing    # robotcode: ignore

*** Test Cases ***
Scenario 01: Delete registered user
    [Tags]    user_delete
    Delete user by ID    ${ID_USER}    # robotcode: ignore
    Verify delete response    # robotcode: ignore
