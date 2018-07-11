require 'rails_helper'

RSpec.describe "company_sales/new", type: :view do
  before(:each) do
    assign(:company_sale, CompanySale.new(
      :buyer => "MyString",
      :description => "MyString",
      :unit_price => 1.5,
      :quantity => 1.5,
      :address => "MyString",
      :supplier => "MyString"
    ))
  end

  it "renders new company_sale form" do
    render

    assert_select "form[action=?][method=?]", company_sales_path, "post" do

      assert_select "input#company_sale_buyer[name=?]", "company_sale[buyer]"

      assert_select "input#company_sale_description[name=?]", "company_sale[description]"

      assert_select "input#company_sale_unit_price[name=?]", "company_sale[unit_price]"

      assert_select "input#company_sale_quantity[name=?]", "company_sale[quantity]"

      assert_select "input#company_sale_address[name=?]", "company_sale[address]"

      assert_select "input#company_sale_supplier[name=?]", "company_sale[supplier]"
    end
  end
end
