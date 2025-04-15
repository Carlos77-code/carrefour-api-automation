*** Settings ***

Resource    ../../Resources/services.resource

*** Keywords ***
Delete user by ID
    [Arguments]    ${id}

    ${response}=    DELETE On Session
    ...             alias=ServeRest
    ...             url=/usuarios/${id}

    Set Test Variable    ${RESPOSTA_DELETE}    ${response.json()}    # robotcode: ignore
    Set Test Variable    ${STATUS_DELETE}      ${response.status_code}    # robotcode: ignore
    Log    ${RESPOSTA_DELETE}    # robotcode: ignore

Verify delete response
    Should Be Equal As Numbers    ${STATUS_DELETE}    200    # robotcode: ignore
    Dictionary Should Contain Item    ${RESPOSTA_DELETE}    message    Registro excluído com sucesso    # robotcode: ignore
