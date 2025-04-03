*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/global_variables.robot

*** Keywords ***
Configurar Navegador
    [Arguments]    ${URL}
    ${options}=    Evaluate    selenium.webdriver.ChromeOptions()    selenium.webdriver
    Call Method    ${options}    add_argument    --start-maximized
    Call Method    ${options}    add_argument    --disable-notifications
    Call Method    ${options}    add_argument    --disable-gpu
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    ${driver}=    Create WebDriver    Chrome    options=${options}
    Go To    ${URL}
    Set Suite Variable    ${driver}

Fechar Navegador
    Close Browser
