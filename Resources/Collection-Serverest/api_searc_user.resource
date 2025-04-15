*** Settings ***
Documentation        Here are the commands for project

Resource        ../../Resources/libraries.resource
Resource        ../../Resources/Collection-Serverest/api_cadastro_usuario.resource



*** Keywords ***
Check the return data
    Log    ${RESP_CONSULTA}