require "test_helper"

class ReportTest < ActiveSupport::TestCase
  test "report is valid" do
    assert reports(:report_felipe1).valid?
  end
end
