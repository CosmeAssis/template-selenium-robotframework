*** Settings ***
Library    SeleniumLibrary
Resource    ../locators/login_locators.robot
Resource  ../resources/global_variables.robot

*** Keywords ***
Abrir Página de Login
    Go To    ${URL}

Preencher Campo de Email
    [Arguments]    ${email}
    Input Text    ${INPUT_EMAIL}    ${email}

Preencher Campo de Senha
    [Arguments]    ${senha}
    Input Text    ${INPUT_SENHA}    ${senha}

Clicar no Botão de Login
    Click Button    ${BTN_LOGIN}

Verificar Mensagem de Erro
    Element Should Be Visible    ${ERROR_MESSAGE}
