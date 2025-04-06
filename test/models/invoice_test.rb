require "test_helper"

class InvoiceTest < ActiveSupport::TestCase
  # validating the invoice number existence and length
  test "should have a number" do
    company = Company.create!(name: "Test Company")

    @invoice = Invoice.new(number: "", company: company)
    assert_not @invoice.valid?, "Invoice should be invalid without a number"

    @invoice = Invoice.new(number: "123456789", company: company)
    assert @invoice.valid?, "Invoice should be valid with a number"
  end

  # testing the company_id existence validation
  test "should require a company" do
    @invoice = Invoice.new(number: "123456789", company: nil)
    assert_not @invoice.valid?, "Invoice should be invalid without a company"
    assert_includes @invoice.errors[:company], "must exist"
  end
end
