require 'csv'

class Report::File

  def initialize(params, current_user)
    @params = params
    @current_user = current_user
  end

  def parse
    binding.pry
    CSV.foreach(@params["file"].tempfile, :headers => true, :col_sep => "\t") do |row|
      CompanySale.create(row.to_h.transform_keys {|key| headers[key]}.merge(user_id: @current_user.id))
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
