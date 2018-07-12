require 'csv'

class Report::File

  def initialize(params)
    @params = params
  end

  def parse
    binding.pry
    CSV.foreach(@params["file"].tempfile, :headers => true, :col_sep => "\t") do |row|
      CompanySale.create(row.to_h.transform_keys {|key| headers[key]})
    end
  end

  private

  def headers
    {
      "Comprador"     =>"buyer",
      "descrição"     =>"description",
      "Preço Uniário" =>"unit_price",
      "Quantidade"    =>"quantity",
      "Endereço"      =>"address",
      "Fornecedor"    =>"supplier"
    }
  end

end
