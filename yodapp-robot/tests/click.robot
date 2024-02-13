*** Settings ***

Library    AppiumLibrary

*** Variables ***

${START}    //android.widget.Button[@text="QAX"] 
# Papito faz com QAX ao invés de xpath, mas ai tava dando erro aqui AttributeError: 'WebDriver' object has no attribute 'desired_capabilities' 
# Uma prática do Papito é usar variável global com todas as letras maiúsculas.
*** Test Cases ***

Deve realizar um click simples

    Open Application    http://localhost:4723	
    ...                 platformName=Android		
    ...                 deviceName=Android Emulator	
    ...                 automationName=UIAutomator2
    ...                 app=${EXECDIR}/app/yodapp-beta.apk
    ...                 udid=emulator-5554
    ...                 autoGrantPermissions=true
           
    Wait Until Element Is Visible        ${START}    10     # quando demorar, tabule e adicione o timeout desejado, o padrão é 5  
    Click Element                        ${START}    # Papito usa Click Text QAX mas aqui tava dando o erro mencionado acima

    ${hamburguer}    Set Variable    //android.widget.ImageButton[@content-desc="Open navigation drawer"]
    Wait Until Element Is Visible    ${hamburguer}    10
    Click Element                    ${hamburguer}
    
    Sleep    3

    ${menu_item}    Set Variable     //*[@resource-id="com.qaxperience.yodapp:id/navView"]//*[@text="Clique em Botões"]
    Wait Until Element Is Visible    ${menu_item}    10
    Click Element                    ${menu_item}
    
    Sleep    3

    Close Application

    