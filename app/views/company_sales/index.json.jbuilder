json.array!(@company_sales) do |company_sale|
  json.extract! company_sale, :id, :buyer, :description, :unit_price, :quantity, :address, :supplier
  json.url company_sale_url(company_sale, format: :json)
end
