require 'rspec'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'rspec/expectations'
require 'pry'

@timeout = ENV.key?('TIMEOUT') && ENV['TIMEOUT'] != '' ? ENV['TIMEOUT'] : 300
@default_max_wait_time = 90

client = Selenium::WebDriver::Remote::Http::Default.new
client.read_timeout = @timeout.to_i

caps = Selenium::WebDriver::Remote::Capabilities.chrome
caps[:unexpectedAlertBehaviour] = 'accept'
caps[:javascriptEnable] = false

options = Selenium::WebDriver::Chrome::Options.new(args: ['start-maximized'])

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    desired_capabilities: caps,
    http_client: client,
    options: options
  )
end

Capybara.default_driver = :chrome
Capybara.javascript_driver = :chrome

Capybara.run_server = false
Capybara.default_selector = :css
Capybara.default_max_wait_time = @default_max_wait_time.to_i

World(Capybara::DSL, Capybara::RSpecMatchers)