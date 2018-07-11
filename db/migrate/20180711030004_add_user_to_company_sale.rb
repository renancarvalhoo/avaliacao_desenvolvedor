class AddUserToCompanySale < ActiveRecord::Migration
  def change
    add_reference :company_sales, :user, index: true
  end
end
