*** Settings ***
Documentation       Teste de pesquisa de produto na loja Magento
Resource            ../resources/global_variables.robot
Resource            ../config/browser_setup.robot
Resource            ../keywords/search_keywords.robot

Suite Setup         Configurar Navegador    ${URL}
Suite Teardown      Fechar Navegador
Test Teardown       Run Keyword If    '${TEST STATUS}' == 'FAIL'    Capture Page Screenshot

*** Test Cases ***
Pesquisar Produto e Validar Resultados
    [Documentation]    Testa a funcionalidade de pesquisa por produto no site
    Acessar Página Inicial
    Pesquisar Por Produto    jacket
    Verificar Resultados Contêm    jacket
