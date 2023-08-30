*** Settings ***
Documentation       Selenium Attach-Chrome Test
Library             RPA.Browser.Selenium


*** Tasks ***
Execute Chrome Attached Browser
    Attach Chrome Browser    9222        
    Maximize Browser Window
    Go To    https://www.google.com/        
    Sleep	2s
    

    

    

    
    
    
    
    
