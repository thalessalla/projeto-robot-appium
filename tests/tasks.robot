*** Settings ***
Documentation    Suite de testes do cadastro de tarefas

Resource    ${EXECDIR}/resources/base.resource

Test Setup    Initiate section
Test Teardown    Finish section

*** Test Cases ***
Deve poder cadastrar uma nova tarefa
    
    ${TASK}    Set Variable    Aprender Apiumm

    Remove task from database    ${TASK}

    Do login
    Create Task         ${TASK}
    Should have task    ${TASK}


Deve poder remover uma tarefa
    [Tags]    remove

     ${TASK}    Set Variable    Aprender Cypress

    Remove task from database    ${TASK}

    Do login
    Create Task         ${TASK}
    Should have task    ${TASK}
    Delete task         ${TASK}

Deve poder concluir uma tarefa
    [Tags]    done

     ${TASK}    Set Variable    Aprender Xpath

    Remove task from database    ${TASK}

    Do login
    Create Task            ${TASK}
    Should have task       ${TASK}
    Finish task            ${TASK}
    Task should be done    ${TASK}
    Delete task            ${TASK}