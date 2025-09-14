*** Settings ***
Documentation    

Resource        libraries.resource 

*** Variables ***
${BASE_URL}    https://serverest.dev
&{HEADERS}    Content-Type=application/json



*** Keywords ***
POST usuarios
    [Arguments]    ${payload}        ${status_code_expected}

    ${response}    POST On Session
    ...            alias=ServeRest
    ...            url=/usuarios
    ...            json=${payload}
    ...            headers=${HEADERS}
    ...            expected_status=${status_code_expected}

    RETURN    ${response}
