*** Settings ***
Documentation    Elementos e ações da tela de login

Library    AppiumLibrary


*** Variables ***
${API_IP}    192.168.3.12

*** Keywords ***
Do Login
    Input Text       xpath=//*[@resource-id="apiIp"]    192.168.3.12
    Click Element    xpath=//*[@resource-id="signInButton"]