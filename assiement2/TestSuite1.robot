*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${query}          The Shawshank Redemption    # query the user will input it in the search box

*** Test Cases ***
TestCase1
    Open Browser    https://www.imdb.com/    firefox
    Input Text    name=q    ${query}
    sleep    2
    Click Button    id=suggestion-search-button
    sleep    2
    Page Should Contain    The Shawshank Redemption
    [Teardown]    Close Browser

TestCase2
    Open Browser    https://www.imdb.com/    firefox
    Click Element    id=imdbHeader-navDrawerOpen
    sleep    2
    Click Link    css=a[href='/chart/top/?ref_=nv_mv_250']
    sleep    2
    page should contain    Top 250 Movies
    Page Should Contain Element    css=.lister-list
    sleep    2
    Page Should Contain Element    xpath=(//td[@class='titleColumn']/a)[1][text()='${query}']
    [Teardown]    Close Browser

TestCase3
    Open Browser    https://www.imdb.com/    firefox
    Click Element    class=ipc-btn__text
    sleep    2
    Click Link    css=a[href='https://www.imdb.com/search/?ref_=nv_sr_menu_adv']
    sleep    2
    Click Link    css=a[href='/search/title'] \
    Select Checkbox    name=title_type
    sleep    2
    Input Text    name=release_date-min    2010
    Input Text    name=release_date-max    2020
    sleep    2
    Select Checkbox    name=genres
    sleep    2
    Click Button    class=primary
    sleep    2
    Click Link    css=a[href='/search/title/?title_type=feature&release_date=2010-01-01,2020-12-31&genres=action&sort=user_rating,desc']
    sleep    2
    [Teardown]    Close Browser
