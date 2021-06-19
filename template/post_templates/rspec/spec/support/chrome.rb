driver = :selenium_chrome_headless

Capybara.server = :puma, {Silent: true}

Capybara.register_driver driver do |app|
  options = ::Selenium::WebDriver::Chrome::Options.new

  options.add_argument("--headless")
  options.add_argument("--no-sandbox")
  options.add_argument("--disable-dev-shm-usage")
  options.add_argument("--window-size=1400,1400")

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.javascript_driver = driver

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by driver
  end
end
