*** Settings ***
Resource    ../pages/search_page.robot

*** Keywords ***
Acessar Página Inicial
    Acessar Página de Pesquisa

Pesquisar Por Produto
    [Arguments]    ${produto}
    Digitar Produto Na Barra De Busca    ${produto}
    Clicar No Botão De Buscar

Verificar Resultados Contêm
    [Arguments]    ${palavra}
    Valida Se Resultados Contêm Texto    ${palavra}
