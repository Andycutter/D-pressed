Feature: Internal Administration page for the Editor
    As an Editor,
    In order to approve or edit the articles sent for my review,
    I would like to have an 'Incoming articles' section in my 'Internal page'

    Background:
        Given the following user exist
        | email          | role   |
        | pablo@test.com | editor |
        And the following articles exists
        | title                 | body                                                                          | 
        | This is so sad        | A recent report suggest that news are mostly sad. Which is sad.               |
        | This is so fun        | A recent report suggest that news are mostly fun. Which is fun.               |
        | This is so tragic     | A recent report suggest that news are mostly tragic. Which is tragic.         |
        | This is so hilarious  | A recent report suggest that news are mostly hilarious. Which is hilarious.   |
        And I am logged in as 'pablo@test.com'

    
    Scenario: Editor can see list of articles
        Given I am on the 'My account' page
        Then I should see 'This is so sad'
        Then I should see 'This is so fun'
        Then I should see 'This is so tragic'
        Then I should see 'This is so hilarious'