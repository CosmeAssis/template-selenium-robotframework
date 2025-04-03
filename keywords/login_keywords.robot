*** Settings ***
Documentation       Keywords para realizar login
Resource           ../resources/global_variables.robot
Library           SeleniumLibrary

*** Variables ***
${LOGIN_INPUT}      xpath=//input[@id="email"]
${PASSWORD_INPUT}   xpath=//input[@id="pass"]
${LOGIN_BUTTON}     xpath=//button[@id="send2"]

*** Keywords ***
Fazer Login
    [Arguments]    ${email}    ${senha}
    Wait Until Element Is Visible    ${LOGIN_INPUT}    timeout=5s
    Input Text    ${LOGIN_INPUT}    ${email}
    Input Text    ${PASSWORD_INPUT}    ${senha}
    Click Button    ${LOGIN_BUTTON}

Verificar Login Bem-Sucedido
    Wait Until Page Contains    My Account    timeout=10s

Verificar Mensagem de Erro
    [Documentation]    Verifica se a mensagem de erro ao tentar login inválido é exibida corretamente
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'error-message')]    timeout=5s
    Element Should Contain    xpath=//div[contains(@class, 'error-message')]    "Invalid login or password."