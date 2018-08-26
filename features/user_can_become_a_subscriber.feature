@javascript
Feature: User can become a Subscriber
    As a registered User,
    In order to be able to see premium content,
    I would like to become a Subscriber of the service.

    As an Editor,
    In order to increase the revenue flow,
    I would like to charge my readers for the subscription.
    PT: https://www.pivotaltracker.com/story/show/159790887

    Background:
        Given the following user exists
            | email          | role       |
            | pablo@test.com | basic_user |
            | sub@scriber.se | subscriber |

    Scenario: Basic_user makes payment and becomes a Subscriber [Happy path]
        When I am logged in as 'pablo@test.com'
        And I am on the 'account page' for my user
        Then I should see my account status displayed as 'Basic user'
        And I click 'Pay with Card' button in the "Become a subscriber" section
        And I fill in the stripe form field "Email" with "pablo@test.com"
        And I fill in the stripe form field "Card number" with "4242 4242 4242 4242"
        And I fill in the stripe form field "CVC" with "123"
        And I fill in the stripe form field "Expiry" with "11/20"
        And I submit the stripe form
        And I wait 3 seconds
        Then I should see 'You have succesfully subscribed to D-pressed'
        Then I should see my account status displayed as 'Subscriber'
        And the user 'pablo@test.com' has the role 'subscriber' in the database
        And I should be on the 'account page' for my user

    Scenario: Basic users payment fails because of insufficient funds [Sad path]
        When I am logged in as 'pablo@test.com'
        And I am on the 'account page' for my user
        Then I should see my account status displayed as 'Basic user'
        And I click 'Pay with Card' button in the "Become a subscriber" section
        And I fill in the stripe form field "Email" with "pablo@test.com"
        And I fill in the stripe form field "Card number" with "4000000000009995"
        And I fill in the stripe form field "CVC" with "123"
        And I fill in the stripe form field "Expiry" with "11/20"
        And I submit the stripe form
        And the card got declined with message 'Your card has insufficient funds.'

    Scenario: Basic users payment fails because of error processing his cars. [Sad path]
        When I am logged in as 'pablo@test.com'
        And I am on the 'account page' for my user
        Then I should see my account status displayed as 'Basic user'
        And I click 'Pay with Card' button in the "Become a subscriber" section
        And I fill in the stripe form field "Email" with "pablo@test.com"
        And I fill in the stripe form field "Card number" with "4000000000000119"
        And I fill in the stripe form field "CVC" with "123"
        And I fill in the stripe form field "Expiry" with "11/20"
        And I submit the stripe form
        And the card got declined with message 'An error occurred while processing your card. Try again in a little bit.'

    Scenario: Subscriber does not see button to become a subscriber
        When I am logged in as 'sub@scriber.se'
        And I am on the 'account page' for my user
        Then I should see my account status displayed as 'Subscriber'
        And I should NOT see 'Pay with Card' button