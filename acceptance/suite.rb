require 'selenium-webdriver'
require 'rspec/expectations'
include RSpec::Matchers

def setup
  caps    = Selenium::WebDriver::Remote::Capabilities.send("chrome")
  # This url is the local access url of the docker container
  @driver = Selenium::WebDriver.for(:remote, url: "http://127.0.0.1:4444/wd/hub", desired_capabilities: caps)
end

def teardown
  @driver.quit
end

def run
  setup
  yield
  teardown
end

run do
  @driver.get 'http://skaaning.ninja'
  expect(@driver.title).to eql "Panoptic culture"
  # @driver.save_screenshot('docker_image.png')
end
