To set up your testing environment in a new rails app to use Rspec and Cucumber...

#### Gemfile: Add the following lines

```
group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :test do
  gem 'shoulda-matchers'
  gem 'cucumber-rails', require: false
  gem 'faker'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'selenium-webdriver'
end
```

If you're using postgresql, which we will in this tutorial

```
gem 'pg'
```

#### Database

Set up your `config/database.yml`. Here's an example using postgresql

```
development:
  adapter: postgresql
  database: yatl_development
  pool: 5
  timeout: 5000
  encoding: unicode

test:
  adapter: postgresql
  database: yatl_test
  pool: 5
  timeout: 5000
  encoding: unicode

staging:
  adapter: postgresql
  database: yatl_staging
  pool: 5
  timeout: 5000
  encoding: unicode

production:
  adapter: postgresql
  database: yatl_production
  pool: 5
  timeout: 5000
  encoding: unicode
```

Then run

```
rake db:create:all
```

#### Setup RSpec

```
rails g rspec:install
```
This generates:

- `.rspec` config file
- `spec/` directory
- `spec/spec_helper.rb`

OPTIONAL: In `.rspec`, add the line

```
--format documentation
```

This will change the format of RSpec's output from

```
....F...FF*...
```

to something like

```
UsersController
  logs in a user
    invalid params
      redirects to homepage
    valid params
      redirects to dashboard
```

#### Setup Cucumber

```
rails generate cucumber:install
```

Open `features/config/env.rb`

Add the following line anywhere

```
World(FactoryGirl::Syntax::Methods)
```
This allows you to use FactoryGirl syntax in your cukes.

#### Configure database_cleaner, factorygirl-rails

Add the following lines to the `rspec.configure` block in `spec/spec_helper.rb`

```
  # Use factorygirl shortened syntax
  config.include FactoryGirl::Syntax::Methods

  # database_cleaner
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
```

Change use_transactional_fixtures to false

```
config.use_transactional_fixtures = false
```
