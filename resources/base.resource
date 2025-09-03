*** Settings ***
Documentation    Tudo deve começar nesse arquivo

Library    AppiumLibrary
Library    libs/mongo.py

Resource    screens/login.resource
Resource    screens/tasks.resource

*** Keywords ***

Initiate section
      Open Application    http://localhost:4723
    ...    automationName=uiautomator2
    ...    platformName=Android
    ...    deviceName=Emulator
    ...    udid=emulator-5554
    ...    autoGrantPermissions=true
    ...    app=${EXECDIR}/apps/markx.apk
    
    Wait Until Page Contains    Endereço IP da Api    10

Finish section
    
        Capture Page Screenshot
        Close Application