require 'rails_helper'

RSpec.describe "company_sales/show", type: :view do
  before(:each) do
    @company_sale = assign(:company_sale, CompanySale.create!(
      :buyer => "Buyer",
      :description => "Description",
      :unit_price => 2.5,
      :quantity => 3.5,
      :address => "Address",
      :supplier => "Supplier"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Buyer/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Supplier/)
  end
end
