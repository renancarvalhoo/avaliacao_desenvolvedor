FactoryBot.define do
  factory :company_sale do
    buyer "Empresa"
    description "Venda de produto"
    unit_price 10.5
    quantity 10
    address "Rua 1"
    supplier "Fornecedor"
  end

  factory :invalid_company_sale, class: CompanySale do
    buyer nil
    description "Venda de produto"
    unit_price 10.5
    quantity 10
    address "Rua 1"
    supplier "Fornecedor"
  end
end
