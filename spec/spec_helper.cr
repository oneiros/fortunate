ENV["LUCKY_ENV"] = "test"
ENV["PORT"] = "5001"
require "spec"
require "lucky_flow"
require "../src/app"
require "./support/flows/base_flow"
require "./support/**"
require "../db/migrations/**"

# Add/modify files in spec/setup to start/configure programs or run hooks
#
# By default there are scripts for setting up and cleaning the database,
# configuring LuckyFlow, starting the app server, etc.
require "./setup/**"

include Carbon::Expectations
include Lucky::RequestExpectations
include LuckyFlow::Expectations

Avram::Migrator::Runner.new.ensure_migrated!
Avram::SchemaEnforcer.ensure_correct_column_mappings!
Habitat.raise_if_missing_settings!

class LuckyFlow::Server
  private def start_session
    driver = Selenium::Webdriver.new
    Selenium::Session.new(driver, capabilities)
  rescue e : Errno
    retry_start_session(e)
  end

  private def capabilities
    CAPABILITIES.merge({
      chromeOptions: {
        args:   ["no-sandbox", "headless", "disable-gpu", "window-size=1400,960"]
      }
    })
  end
end
