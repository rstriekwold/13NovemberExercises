*** Settings ***

Documentation                   Create a new Salesforce Trail
Library                         QWeb
Library                         DateTime
Library                         String
Library                         BuiltIn
Suite Setup                     Open Browser                about:blank                 chrome
Suite Teardown                  Close All Browsers


*** Variables ***

${email_address}                pkievit+122@copado.com


*** Test Cases ***

    # Try run Exercise 4 - Create Salesforce Trial Org with your own email address first!

    # Resort to Mailinator only in case you don't receive emails from Salesforce using +X in your mail address.
    # Copy the mailinator url from live testing into you own browser
    # For you to login to your salesforce trial org.
    # To also validate your browser and laptop.
Exercise 4 - Do it for me! Create online mailbox
    GoTo                        https://www.mailinator.com/
    ${unique_mail_address}=     Generate Random String      14                          [NUMBERS]temponlinemail
    Type Text                   Enter Public Mailinator Inbox                           ${unique_mail_address}
    Click Text                  GO
    Set Suite Variable          ${email_address}            ${unique_mail_address}@mailinator.com
    Log to Console              ${email_address}
    ${url}=                     GetUrl
    Set Global Variable         ${mailinator_url}           ${url}
    Log to Console              \n\n\n\n\n\nCOPY THIS LINK TO YOUR OWN BROWSER\n\n
    Log to Console              \n\n${mailinator_url}\n\n\n\n\n\n
    Open Window


Exercise 4 - Create Salesforce Trial Org
    GoTo                        https://www.salesforce.com/form/signup/freetrial-sales-pe/

    # Handle Cookie Popup
    ${cookies_popup_present}=                               IsText                      Accept All Cookies
    Log to Console              ${cookies_popup_present}
    IF                          ${cookies_popup_present}
        ClickText               Accept All Cookies
    END

    VerifyText                  Start your free sales trial

    Evaluate                    random.seed()               random
    ${exampleFirstName}=        Convert To String           guest1
    ${randomString}=            Generate Random String      length=3-5                  chars=0123456789
    ${FirstName}=               Format String               {}{}                        ${exampleFirstName}         ${randomString}


    TypeText                    First name                  ${FirstName}
    TypeText                    Last name                   user
    TypeText                    Job title                   Learner
    ClickText                   Next

    DropDown                    Employees                   21 - 200 employees
    TypeText                    Company                     xyz
    ClickText                   Next


    TypeText                    Phone                       9999999999
    TypeText                    Email                       ${email_address}
    ClickElement                //div[@class\="checkbox-ui"]

    ClickText                   Submit

    #                           Create robot variables with the login information from your mail and input

    # Example here:
    # ${browser}                chrome
    # ${username}               ea9mlm8la81a5l-pmcd@force.com
    # ${login_url}              https://energy-force-4969.my.salesforce.com             # Salesforce instance. NOTE: Should be overwritten in CRT variables
    # ${home_url}               ${login_url}/lightning/page/home
    # ${password}               TrialSF01!

Exercise 4 - Do it for me! Read Mail, Verify Account and Set Password
    Switch Window               1
    ${email_count}=             Get Text Count              Welcome to Salesforce
    Log to Console              ${email_count}
    IF                          '${email_count}' > '${0}'
        Log to Console          I've found an existing mail, let's wait 180 sec for the new mail to arrive.
        Sleep                   180
    ELSE
        ClickItemUntil          Welcome to Salesforce       GO                          timeout=180
    END
    ClickText                   Welcome to Salesforce
    ScrollText                  Again, welcome to Salesforce
    ${sftrial_url}=             GetText                     login-href                  tag=a
    ${sftrial_username}=        GetText                     span-user-name              tag=span
    ClickText                   Verify Account
    Switch Window               3
    Log Screenshot

    # Sometimes verify your identify screen appears first where you need to enter an emailed verification code
    ${code_needed}=             IsText                      Verify Your Identity

    IF                          '${code_needed}' == 'True'
        Log to Console          Verify Identify Screen appeared, get email verification code and enter it
        Switch Window           1
        ${email_count}=         Get Text Count              Verify Your Identity
        Log to Console          ${email_count}

        IF                      '${email_count}' > '${0}'
            Log to Console      I've found an existing mail, let's wait 180 sec for the new mail to arrive
            Sleep               180
        ELSE
            ClickItemUntil      Verify Your Identity        GO                          timeout=180
        END
        Log Screenshot
        ${email_body}=          Get Text                    gmail_quote                 tag=div
        ${code} =               Get Regexp Matches          ${email_body}               Verification Code: (......)                      1
        Switch Window           3
        Type Text               Verification Code           ${code}
        Log Screenshot
        Click Text              Verify                      anchor=again
    ELSE
        Log to Console          Verify Identify Screen did not appear, continue set password
    END

    Switch Window               3
    Set Suite Variable          ${password}                 TrialSF01!
    TypeText                    New Password                ${password}
    TypeText                    Confirm New Password        ${password}
    TypeText                    Answer                      Krypton
    ClickText                   Change Password
    Log Many                    ${email_address}            ${sftrial_url}              ${sftrial_username}         ${password}
    # ClickText                   Close this window
    Set Global Variable         ${browser}                  chrome
    Set Global Variable         ${login_url}                ${sftrial_url}
    Set Global Variable         ${home_url}                 ${login_url}/lightning/page/home
    Set Global Variable         ${username}                 ${sftrial_username}
    Set Global Variable         ${password}                 ${password}
    Set Global Variable         ${mailinator_url}           ${mailinator_url}
    Log To Console              ${login_url}
    Log To Console              ${home_url}
    Log To Console              ${username}
    Log To Console              ${password}
    Log to Console              ${mailinator_url}
    # ClickText                 View profile
    # ClickText                 Log Out

    #Keep the live testing open with your mailinator mailbox! Open your own chrome browser on your laptop and login to your sf trail. Get the code form mailinator in live testing!!!!
    # Exercise 4 - Do it for me! Login to the trail org to Verify Account if needed
    #                           Appstate                    Home
    #                           Log Screenshot
    #                           Log To Console              ${login_url}
    #                           Log To Console              ${home_url}
    #                           Log To Console              ${username}
    #                           Log To Console              ${password}
    #                           Log to Console              ${mailinator_url}

Exercise 5 - Allowlist IPs at Setup Network Access
    [tags]                      IPs
    # Login and Verify Code

    ClickText                   Setup
    ClickText                   Opens in a new tab
    SwitchWindow                NEW
    VerifyText                  Users                       anchor=Administration
    TypeText                    Quick Find                  Network Access              tag=input                   anchor=Setup Home
    Verify Text                 Network Access              anchor=Security
    ClickText                   Network Access

    @{NorthAmericaIPs}=         Create List                 3.216.108.92                52.7.118.168                75.101.241.39
    @{EuropeIPs}=               Create List                 18.203.104.35               18.202.59.38                52.212.32.52
    @{AustraliaIPs}=            Create List                 13.238.101.70               54.79.113.39                54.66.15.135
    @{SingaporeIPs}=            Create List                 3.0.203.255                 54.151.254.16               52.76.148.77

    Log                         ${NorthAmericaIPs}
    FOR                         ${IP}                       IN                          @{NorthAmericaIPs}
        ClickText               New
        TypeText                Start IP Address            ${IP}
        TypeText                End IP Address              ${IP}
        TypeText                Description                 North-America
        ClickText               Save
        VerifyText              ${IP}
    END

    Log                         ${EuropeIPs}
    FOR                         ${IP}                       IN                          @{EuropeIPs}
        ClickText               New
        TypeText                Start IP Address            ${IP}
        TypeText                End IP Address              ${IP}
        TypeText                Description                 Europe
        ClickText               Save
        VerifyText              ${IP}
    END

    Log                         ${AustraliaIPs}
    FOR                         ${IP}                       IN                          @{AustraliaIPs}
        ClickText               New
        TypeText                Start IP Address            ${IP}
        TypeText                End IP Address              ${IP}
        TypeText                Description                 Australia
        ClickText               Save
        VerifyText              ${IP}
    END

    Log                         ${SingaporeIPs}
    FOR                         ${IP}                       IN                          @{SingaporeIPs}
        ClickText               New
        TypeText                Start IP Address            ${IP}
        TypeText                End IP Address              ${IP}
        TypeText                Description                 Singapore
        ClickText               Save
        VerifyText              ${IP}
    END

    Log Screenshot
    Log To Console              ${login_url}
    Log To Console              ${home_url}
    Log To Console              ${username}
    Log To Console              ${password}
    Log to Console              ${mailinator_url}
    Log                         ${login_url}
    Log                         ${home_url}
    Log                         ${username}
    Log                         ${password}
    Log                         ${mailinator_url}

*** Keywords ***

Home
    [Documentation]             Navigate to homepage, login if needed
    GoTo                        ${home_url}
    Log Screenshot
    ${login_status} =           IsText                      To access this page, you have to log in to Salesforce.                       2
    Run Keyword If              ${login_status}             Login
    ClickText                   Home
    VerifyTitle                 Home | Salesforce

Login
    [Documentation]             Login to Salesforce instance
    GoTo                        ${login_url}
    TypeText                    Username                    ${username}                 delay=1
    TypeText                    Password                    ${password}
    ClickText                   Log In

Login and Verify Code
    [Documentation]             Login to Salesforce instance
    GoTo                        ${login_url}
    TypeText                    Username                    ${username}                 delay=1
    TypeText                    Password                    ${password}
    ClickText                   Log In


    ${code_needed}=             IsText                      Verify Your Identity

    IF                          '${code_needed}' == 'True'
        Log to Console          Verify Identify Screen appeared, get email verification code and enter it
        Open Window
        Switch Window           NEW
        GoTo                    ${mailinator_url}
        ${email_count}=         Get Text Count              Verify your identity in Salesforce
        Log to Console          ${email_count}
        ClickText               Verify your identity in Salesforce                      delay=5s
        Log Screenshot
        ${email_body}=          Get Text                    //body[@marginheight\='0']
        ${code} =               Get Regexp Matches          ${email_body}               Verification Code: (......)                      1
        Log to Console          ${code}
        Switch Window           1
        Type Text               Verification Code           ${code}[0]
        Log Screenshot
        Click Text              Verify                      anchor=again
    ELSE
        Log to Console          Verify Identify Screen did not appear, continue set password
    END

    SwitchWindow                1