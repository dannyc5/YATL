# Rails Testing Crash-Course: Notes

Check out this repo at [https://github.com/danielchangNYC/YATL](https://github.com/danielchangNYC/YATL)

## Setup

Changes are already included in master, but if you want to reference the steps, check out [testing_setup.md](https://github.com/danielchangNYC/YATL/blob/master/testing_setup.md) or the second commit.

## Setting up Data for tests
  - Fixtures
    - YAML file for preset, hard-coded sample data you can call in your tests
    - PROS: Fast
    - CONS:
      - Can get unwieldy as it grows and there's a need for edge-cases
      - Bypasses actual creation and therefore validations
  - FactoryGirl
    - PROS:
      - Easier to make edge-cases
      - Easily modifiable
      - Extremely readable
      - Validates with creation
    - CONS:
      - Slow
  - Mocks and Stubs: Saving this for later.

## What does our development-cycle at Flatiron Labs look like?
- Your future job may have a codified style-guide and a preferred work-flow that's different, but you'll probably find a lot of similar principles guiding those choices
- TDD
  - Write tests
  - Watch them fail
  - Pass them (with minimal code)
  - Refactor
- BDD
  - Involves business side in Agile development process
  - "Is the feature good enough for the client to accept it into the system?"
  - Uses TDD
  - "Outside-in"
    - Test from the perspective of the user
      - How will someone use your feature?
      - What will he/she expect to see and do?
    - View (acceptance/feature/integration tests) -> Controller (functional tests) -> Model (unit tests)
  - As opposed to "inside-out"
    - model -> controller -> view

## User Stories as an Agile Development tool
- User stories clarify what a feature does, who will use it, and why it's valuable to them.
- Helps us communicate more clearly with the client
- Format
  - As a... (stakeholder)
  - I need to... (feature)
  - So that... (value-added)
- Examples
  - **As a** user, **I need to** create a to-do **so that** I can keep track of my actions for the day.
  - **As a** user, **I need to** mark a to-do as finished **so that** I can quickly view what else needs to get done.

**Check out the [Pivotal Tracker](https://www.pivotaltracker.com/n/projects/1063890) for this repo**

If that doesn't work, here are a few user stories you can work on. We'll go through the first one together as an example.

- As a user, I need to create a problem so that I can hide my real problems.
- As a user, I need to delete problems so that I can pretend I forgot.
- As a user, I need to edit a problem so that I can turn a situation into whatever makes the most sense to my erratic heart at the time.
- As a user, I need to mark a problem as finished so that I can feel a fleeting sense of security before what's bound to happen later: more problems.
- As a user, I need a button to generate problems so that I can close the work-on-problem/create-a-problem ratio.

## Cucumber Test (a type of Acceptance Test)
- Compare: Feature test (w/o cucumber) and Acceptance test (w cucumber)
- 3 A's
  - Arrange
  - Act
  - Assert
- Cucumber turns the 3 A's into Given/When/Then statements that take `regex` arguments
- All cucumber tests go in the `feature/` folder. You can create whatever subfolders you'd like.
- All statements go in `feature/step-definitions` and are reusable.
- run your cukes in command-line with the command `cucumber`

## Controller Tests (a type of Functional Test)
- What do we put in a controller test? => What is the purpose of a controller?
  - Assign values (`@user = User.find(params[:id])`)
  - Save data to the database
  - Render
  - Redirect

## Model Tests (a type of Unit Test)
- Test one thing at a time
  - Good: "it 'generates a Chat between two users'"
  - Good: "it 'marks a lesson as finished'"
  - Smelly: "it 'generates a token and associates a user to the token'"
- Don't over-test
  - Don't test something that's already been tested (eg. Rails or Devise)
- Happy path / Sad Path
  - Happy Path: it 'generates a Chat between two users' - Sad Path: it 'throws an error if a user does not exist'

## Pair-Program / Try it yourself
Directions
1. Make sure you've cloned the repo.
2. Look at the user stories on the pivotal tracker for this application.
3. Start the first card in the Current column and write your tests. Start with the Cucumber tests and then proceed inwards towards Model specs and back out.

## Quick Review:
  - Test one thing at a time
  - Don't over-test
  - Happy/Sad paths
  - 3 A's
  - TDD
  - BDD

## Better Specs
- cucumber tags
  - Write `@tag` above any `Scenario`s, then type `cucumber -t @tag` to run any tagged cukes.
  - Write `@javascript` to run a `Scenario` using the `selenium` web-driver.
- Use Mocks and Stubs. NOTE: This section is a work in progress.
  - **Stubs** define the return value of a method.
    - `scraper.stub(:scrape_page).with("<html>...</html>")`
    - OR: `scraper.stub(:scrape_page) {"<html>...</html>"}`
        - Use-case: You need to call a slow or taxing method, but it's not the main focus of your test.x  - In the exampleou, we're testing a method returns the number of `<ul>` elements in a page that you scraped, which reqreous us to call `#scrape_page`. Stub the return value of the `#scrape_page` method with a hard-coded string of-   TML.
  - "**Mocks** define an expectation that a message will get sent." - Sandi Metz, POODR pg 217
    - `scraper.should_receive(:scrape_page)` # => tests that the message gets sent but doesn't necessarily run the code in that method
  - **Used Together**
    - `allow(scraper).to receive(:scrape_page).and_return("<html>...</html>")`
    - Shorter: `allow(scraper).to receive(:scrape_page) { "<html>...</html>" }`
- **DRY**: Use `let` and `let!` statements to `Arrange` data when possible; use `before :each` blocks to `Act` when possible

## Recommended Resources
- Highly-Recommended Reading: Everyday Rails Testing with RSpec, by Aaron Sumner
- POODR (Programming Object-Oriented Design in Ruby), by Sandi Metz
- [Difference between test types](https://stackoverflow.com/questions/4904096/whats-the-difference-between-unit-functional-acceptance-and-integration-test)
- c2.com for more terminology stuff
  - [Acceptance Tests][2] in the BDD world ("Is the feature good enough for the client to accept it into the system?")
   - [Integration tests][1]? => Test the integration of several units into a larger system. Some people refer to feature specs as integration specs.

[1]: http://c2.com/cgi/wiki?IntegrationTest
[2]: http://c2.com/cgi/wiki?AcceptanceTest
