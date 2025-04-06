require "test_helper"

class CheckTest < ActiveSupport::TestCase
  test "check should have a created_at" do
    company = Company.create!(name: "Test Company")

    check = Check.new(number: "123456789", company: company)
    check.created_at = nil
    assert_not check.save, "Check should be invalid without a created_at"

    check = Check.create!(number: "123456789", company: company, created_at: Time.now, image: "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png")
    assert check.valid?, "Check should be valid since created_at is automatically assigned"
  end

  test "check should require a company" do
    check = Check.new(number: "123456789", company: nil)
    assert_not check.valid?, "Check should be invalid without a company"
    assert_includes check.errors[:company], "must exist"
  end

  test "check should have a image" do
    company = Company.create!(name: "Test Company")
    check = Check.new(number: "123456789", company: company, image: nil)
    assert_not check.valid?, "Check should be invalid without an image"

    check = Check.new(number: "123456789", company: company, created_at: Time.now, image: "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png")
    assert check.valid?, "Check should be valid with an image"
  end
end
