*** Settings ***
Documentation    Elementos e ações da tela de tarefas

Library    AppiumLibrary


*** Variables ***
${INPUT_TASK}    xpath=//*[contains(@text, "nova tarefa")]
${BTN_CREATE_TASK}    xpath=//*[@resource-id="createTask"]
${BTN_SIM}    id=android:id/button2
${TXT_ALERT}    xpath=(//android.widget.TextView)[2]
${BTN_TASK_FINISH}

*** Keywords ***
Create Task    [Arguments]    ${TASK}
    
    Wait Until Element Is Visible    ${INPUT_TASK}
    Input Text                       ${INPUT_TASK}        ${TASK}    
    Click Element                    ${BTN_CREATE_TASK}    


    
Should have task    [Arguments]    ${TASK}

    Wait Until Page Contains    ${TASK}



Delete task    [Arguments]    ${TASK}
    
    Click Element    //*[@resource-id="taskText" and contains(@text, "${TASK}")]/../..//*[@resource-id="removeTask"]
    Element Should Contain Text         ${TXT_ALERT}    Tem certeza que deseja remover a tarefa?
    Click Element                       ${BTN_SIM}    
    Wait Until Page Does Not Contain    ${TASK}    


Finish task    [Arguments]    ${TASK}
    Click Element    xpath=//*[@text="${TASK}"]

Task should be done    [Arguments]    ${TASK}
    Element Should Be Visible    xpath=//*[@text="${TASK}"]/..//android.widget.ImageView