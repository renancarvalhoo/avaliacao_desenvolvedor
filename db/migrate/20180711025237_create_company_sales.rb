class CreateCompanySales < ActiveRecord::Migration
  def change
    create_table :company_sales do |t|
      t.string :buyer
      t.string :description
      t.float :unit_price
      t.float :quantity
      t.string :address
      t.string :supplier

      t.timestamps
    end
  end
end
