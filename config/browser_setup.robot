*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Keywords ***
Configurar Navegador
    [Arguments]    ${URL}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --disable-notifications
    Call Method    ${options}    add_argument    --disable-gpu
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    ${driver}=    Create WebDriver    Chrome    options=${options}
    Go To    ${URL}
    Set Suite Variable    ${driver}

Fechar Navegador
    Close Browser
