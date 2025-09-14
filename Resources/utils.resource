*** Settings ***
Documentation    


*** Variables ***
${SCREENSHOTS_DIR}    Reports/screenshots

*** Keywords ***
Log Custom Message
    [Arguments]    ${message}
    ${log_file}=    Set Variable    logs/custom_log.txt
    Append To File    ${log_file}    ${message}\n    # robotcode: ignore
    Log               CUSTOM LOG: ${message}


Salvar Resposta JSON
    [Arguments]    ${response_payload}    ${filename}
    ${path}=    Set Variable    ${SCREENSHOTS_DIR}/${filename}.json
    Create File    ${path}    ${response_payload}    # robotcode: ignore
    Log            JSON salvo em: ${path}


Ensure Directory Exists
    [Arguments]    ${directory}
    Create Directory    ${directory}    # robotcode: ignore
    Log                 Directory ensured: ${directory}
