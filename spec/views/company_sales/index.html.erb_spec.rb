require 'rails_helper'

RSpec.describe "company_sales/index", type: :view do
  before(:each) do
    assign(:company_sales, [
      CompanySale.create!(
        :buyer => "Buyer",
        :description => "Description",
        :unit_price => 2.5,
        :quantity => 3.5,
        :address => "Address",
        :supplier => "Supplier"
      ),
      CompanySale.create!(
        :buyer => "Buyer",
        :description => "Description",
        :unit_price => 2.5,
        :quantity => 3.5,
        :address => "Address",
        :supplier => "Supplier"
      )
    ])
  end

  it "renders a list of company_sales" do
    render
    assert_select "tr>td", :text => "Buyer".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Supplier".to_s, :count => 2
  end
end
