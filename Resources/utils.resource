*** Settings ***
Documentation    


*** Variables ***
${SCREENSHOTS_DIR}    reports/screenshots

*** Keywords ***
Log Custom Message
    [Arguments]    ${message}
    ${log_file}=    Set Variable    logs/custom_log.txt
    Append To File    ${log_file}    ${message}\n
    Log               CUSTOM LOG: ${message}


Salvar Resposta JSON
    [Arguments]    ${response_body}    ${filename}
    ${path}=    Set Variable    ${SCREENSHOTS_DIR}/${filename}.json
    Create File    ${path}    ${response_body}
    Log            JSON salvo em: ${path}


Ensure Directory Exists
    [Arguments]    ${directory}
    Create Directory    ${directory}
    Log                 Directory ensured: ${directory}