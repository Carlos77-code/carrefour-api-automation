*** Settings ***
Documentation        Aqui estão os comandos para o projeto

Resource        ../../Resources/libraries.resource
Resource        ../../Resources/services.resource



*** Keywords ***
Buscar usuário por ID
    [Arguments]    ${id}
    ${response}=    GET On Session    ServeRest    /usuarios/${id}
    Set Test Variable    ${RESP_CONSULTA}    ${response.json()}    # robotcode: ignore
    Log    ${RESP_CONSULTA}    # robotcode: ignore

Validar dados retornados do usuário
    Dictionary Should Contain Item    ${RESP_CONSULTA}    email           ${EMAIL_TEST}    # robotcode: ignore
    Dictionary Should Contain Item    ${RESP_CONSULTA}    administrador   true    # robotcode: ignore
    Dictionary Should Contain Key     ${RESP_CONSULTA}    _id    # robotcode: ignore
