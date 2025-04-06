require "test_helper"

class CompanyTest < ActiveSupport::TestCase
  test "should have a name" do
    @company = Company.new(name: "")
    assert_not @company.valid?, "Company should be invalid without a name"

    @company = Company.new(name: "Telaeris")
    assert @company.valid?, "Company should be valid with a name"
  end
end
