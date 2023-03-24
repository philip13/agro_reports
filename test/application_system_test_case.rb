require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  DRIVER = if ENV["DRIVER"]
    ENV["DRIVER"].to_sym
  else
    :headless_chrome
  end

  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400]
end
