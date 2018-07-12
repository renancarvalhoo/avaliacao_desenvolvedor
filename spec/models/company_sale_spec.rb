require 'rails_helper'

RSpec.describe CompanySale, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validates' do
    it { should validate_presence_of(:buyer) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:unit_price) }
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:supplier) }
  end

  describe 'CompanySale' do

    it "is invalid without buyer" do
      expect(FactoryBot.build(:company_sale, buyer: nil)).to_not be_valid
    end
    it "is invalid without description" do
      expect(FactoryBot.build(:company_sale, description: nil)).to_not be_valid
    end
    it "is invalid without unit_price" do
      expect(FactoryBot.build(:company_sale, unit_price: nil)).to_not be_valid
    end
    it "is invalid without quantity" do
      expect(FactoryBot.build(:company_sale, quantity: nil)).to_not be_valid
    end
    it "is invalid without address" do
      expect(FactoryBot.build(:company_sale, address: nil)).to_not be_valid
    end
    it "is invalid without supplier" do
      expect(FactoryBot.build(:company_sale, supplier: nil)).to_not be_valid
    end
  end
end
