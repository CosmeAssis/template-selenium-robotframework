*** Settings ***
Documentation       Teste de login na loja Magento
Resource           ../resources/global_variables.robot
Resource           ../config/browser_setup.robot
Resource           ../keywords/login_keywords.robot

Suite Setup        Configurar Navegador    ${URL}
Suite Teardown     Fechar Navegador
Test Teardown      Run Keyword If    '${TEST STATUS}' == 'FAIL'    Log    "🔴 Teste falhou, seguindo para o próximo."

*** Test Cases ***
Teste de Login Válido
    [Documentation]    Testa login com credenciais válidas
    Fazer Login    ${LOGIN}    ${PASSWORD}
    Verificar Login Bem-Sucedido

Teste de Login Inválido
    [Documentation]    Testa login com credenciais inválidas
    Fazer Login    ${LOGIN}    wrongpassword
    Verificar Mensagem de Erro
