*** Settings ***
Library    SeleniumLibrary
Resource   ../locators/search_locators.robot
Resource   ../resources/global_variables.robot

*** Keywords ***
Acessar Página de Pesquisa
    Go To    ${URL}
    Wait Until Element Is Visible    ${SEARCH_INPUT}    timeout=10s

Digitar Produto Na Barra De Busca
    [Arguments]    ${produto}
    Input Text    ${SEARCH_INPUT}    ${produto}

Clicar No Botão De Buscar
    Click Button    ${SEARCH_BUTTON}
    Wait Until Page Contains Element    ${SEARCH_RESULTS}    timeout=10s

Valida Se Resultados Contêm Texto
    [Arguments]    ${texto}
    Page Should Contain    ${texto}
