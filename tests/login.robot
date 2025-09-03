*** Settings ***
Documentation    Testes de Login

Resource    ../resources/base.resource

Test Setup    Initiate section
Test Teardown      Finish section

*** Test Cases ***
Deve logar com sucesso

    Do Login

    Wait Until Page Contains    Minhas tarefas    5

    