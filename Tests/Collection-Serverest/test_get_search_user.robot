*** Settings ***
Documentation        Here is the step by step for the requests for project.

Resource        ../../Resources/Collection-Serverest/api_cadastro_usuario.resource
Resource        ../../Resources/utils.resource

Suite Setup    Ensure Directory Exists    reports/screenshots


*** Test Cases ***
Scenario 01: Search user for id
    [Tags]    search_for_id
    Create a new user
    Register the user create at the Serverest    ${EMAIL_TEST}    status_code_expexted=201
    Check the user register data
    Check the return data