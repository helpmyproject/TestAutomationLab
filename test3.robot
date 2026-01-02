*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CHROME_BROWSER_PATH}    ${EXECDIR}${/}chrome-win64${/}chrome.exe
${CHROME_DRIVER_PATH}    ${EXECDIR}${/}chromedriver-win64${/}chromedriver.exe
${URL}    http://localhost:7272/Lab4/Registration.html

*** Keywords ***
Open Browser To Registration Page
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${chrome_options.binary_location}    Set Variable    ${CHROME_BROWSER_PATH}
    ${service}    Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    Go To    ${URL}

*** Test Cases ***
Empty First Name
    [Documentation]

    Open Browser To Registration Page
    
    Input Text    id=lastname    Sodyod
    Input Text    id=organization    CS KKU
    Input Text    id=email    somyod@kkumail.com
    Input Text    id=phone    091-001-1234
    
    Click Button    id=registerButton
        
    [Teardown]  Close Browser