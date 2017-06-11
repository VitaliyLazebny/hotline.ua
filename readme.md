**Test Suite** for 'Comparation' feature of hotline.ua

There's implemented 4 testcases:
1. Add 2 goods to comparation and open Comparation page
2. Check if goods are present on comparation page
3. Check if user see error message when there's no goods for comparation
4. Check if user see error message when there's only 1 good fro comparation

Last scenario will fail on current user site implementation.
Currently on hotline.ua you can see comparation of only one item. It's a little strange. But possible it's conscious decision.

**Used tools**:
Ruby 2.2
Cucumber (implementation of human-readable test cases)
RSpec (testing tool)
Watirsome (implements PageObject pattern)
Watir (for browser control using Selenium, it's one of Selenium bindings actually)
Selenium binary drivers

**Installation** on Ubuntu linux system:
>gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
>curl -sSL https://get.rvm.io | bash -s stable
>source ~/.rvm/scripts/rvm
>rvm install 2.2
>rvm use 2.2 --default
>ruby -v
>gem install bundle

From repo dir:
>bundle install

You need download Selenium Driver binary and place it in any PATH dir.
url: https://sites.google.com/a/chromium.org/chromedriver/downloads

And install Chrome browser

**Execute** tests:
>bundle exec cucumber

You can execute only some test scenarios:
>bundle exec cucumber features/comparator.feature:27

(scenario described at comparator.feature starting from line 27)

Directory structure:
``````
|-config (configuration files)
|   |-cucumber.yml (log output, ruby-envirounment parameters)
|   \-settings.yml (browser, starting page)
|
|-features
|   |-lib  (base page, some helper modules)
|   |-page (page object definitions)
|   |-step_definitions (used for steps parsing)
|   |-support (build internal ruby envirounment, hooks)
|   |
|   \-comparator.feature (test scenarios for Comparator feature)
|
|-Gemfile (list of required ruby libs for ruby-bundler tool)
|-readme.md (this file)
|-report.html (example of report in html formar)

```