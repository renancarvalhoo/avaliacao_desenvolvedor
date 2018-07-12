class CompanySale < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :buyer, :description, :unit_price, :quantity, :address, :supplier
end
