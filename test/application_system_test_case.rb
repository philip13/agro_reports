require "test_helper"
require "webdrivers"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  DRIVER = if ENV["DRIVER"]
    ENV["DRIVER"].to_sym
  else
    :headless_firefox
  end

  driven_by :selenium, using: DRIVER, screen_size: [1400, 1400]
end
