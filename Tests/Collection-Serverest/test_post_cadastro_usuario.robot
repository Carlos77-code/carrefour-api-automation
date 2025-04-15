*** Settings ***
Documentation        Here is the step by step for the requests for project.

Resource        ../../Resources/Collection-Serverest/api_cadastro_usuario.resource
Resource        ../../Resources/utils.resource

Suite Setup    Ensure Directory Exists    reports/screenshots

*** Test Cases ***
Scenario 01: User registration with valid data
    [Tags]    user_registration_valid_data
    Create a new user
    Register the user create at the Serverest    ${EMAIL_TEST}    status_code_expected=201    # robotcode: ignore
    Check if the user go register right

Scenario 02: Register existing user
    [Tags]    register_existing_user
    Create a new user
    Register the user create at the Serverest    ${EMAIL_TEST}    status_code_expected=201    # robotcode: ignore
    Repeat the register user already exists
    Check if the API does not allow duplicate registration

Scenario 03: Search user for id
    [Tags]    search_for_id
    Create a new user
    Register the user create at the Serverest    ${EMAIL_TEST}    status_code_expected=201    # robotcode: ignore
    Check the user register data
    Check the return data

