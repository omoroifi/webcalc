*** Settings ***
Library    RequestsLibrary

Suite Setup    Connect to server


*** Variables ***
${WEB_HOST}    localhost
${WEB_PORT}    5000

*** Keywords ***
Connect to server
    [Documentation]   Create session
    Create Session    calcsession    http://${WEB_HOST}:${WEB_PORT}


*** Test Cases ***
Test Adding Two Numbers
    [Documentation]    9+3=12
    ${json}=  To Json   [9, 3]
    ${response}=    Get Request    calcsession    /add    json=${json}
    Should Be Equal    ${response.status_code}    ${200}
    Should Be Equal    ${response.json()}    ${12}

Test Substraction Two Numbers
    [Documentation]    9-3=6
    ${json}=  To Json   [9, 3]
    ${response}=    Get Request    calcsession    /sub    json=${json}
    Should Be Equal    ${response.status_code}    ${200}
    Should Be Equal    ${response.json()}    ${6}

Test Multiplying Two Numbers
    [Documentation]    9*3=27
    ${json}=  To Json   [9, 3]
    ${response}=    Get Request    calcsession    /mul    json=${json}
    Should Be Equal    ${response.status_code}    ${200}
    Should Be Equal    ${response.json()}    ${27}

Test Dividing Two Numbers
    [Documentation]    9/3=3
    ${json}=  To Json   [9, 3]
    ${response}=    Get Request    calcsession    /div    json=${json}
    Should Be Equal    ${response.status_code}    ${200}
    Should Be Equal    ${response.json()}    ${3}
