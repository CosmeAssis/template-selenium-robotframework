*** Variables ***
${ENV}              %{ENVIRONMENT=qa}
${URL}              https://magento.softwaretestingboard.com/
${LOGIN}            user@example.com
${PASSWORD}         mypassword

*** Keywords ***
Carregar Configuração Por Ambiente
    Run Keyword If    '${ENV}' == 'prod'     Set Suite Variable    ${URL}    https://prod.seusite.com
    Run Keyword If    '${ENV}' == 'dev'      Set Suite Variable    ${URL}    https://dev.seusite.com
    Run Keyword If    '${ENV}' == 'qa'       Set Suite Variable    ${URL}    https://magento.softwaretestingboard.com/
