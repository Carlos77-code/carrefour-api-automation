*** Settings ***
Documentation

Resource    ../../Resources/setup_teardown.resource    # robotcode: ignore
Resource    ../../Resources/Collection-Serverest/Api_login.resource


Suite Setup    User registration for testing    # robotcode: ignore

*** Test Cases ***
Scenario 01: Login with success
    [Tags]    login_success
    Perform login with valid credentials    ${EMAIL_TEST}    ${PASSWORD}    # robotcode: ignore
    Validate login with token

Scenario 02: Login with invalid data - invalid email
    [Tags]    login_email_invalid
    Perform login with invalid credentials    test123test@qa.com    123    401    # robotcode: ignore
    Validate message and status code for invalid email

Scenario 03: Login with empty email field
    [Tags]    login_email_empty
    Perform login with empty email field    123    400    # robotcode: ignore
    Validate status code for empty email

Scenario 04: Login with invalid data - invalid password
    [Tags]    login_password_invalid
    Perform login with invalid password credentials    ${EMAIL_TEST}    789    401    # robotcode: ignore
    Validate message and status code for invalid password

Scenario 05: Login with empty password field
    [Tags]    login_password_empty
    Perform login with empty password field    ${EMAIL_TEST}    400    # robotcode: ignore
    Validate status code for empty password