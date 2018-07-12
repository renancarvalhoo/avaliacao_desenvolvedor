require 'rails_helper'


RSpec.describe CompanySalesController, type: :controller do

  login_user

  describe "GET #index" do
    it "returns a success response" do
      company_sale = FactoryBot.create(:company_sale)
      get :index, {}
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      company_sale = FactoryBot.create(:company_sale)
      get :show, {:id => company_sale.to_param}
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, {}
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      company_sale = FactoryBot.create(:company_sale)
      get :edit, {:id => company_sale.to_param}
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new CompanySale" do
        expect {
          post :create, {:company_sale => FactoryBot.attributes_for(:company_sale)}
        }.to change(CompanySale, :count).by(1)
      end

      it "redirects to the created company_sale" do
        post :create, {:company_sale => FactoryBot.attributes_for(:company_sale)}
        expect(response).to redirect_to(CompanySale)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, {:company_sale => FactoryBot.attributes_for(:invalid_company_sale)}
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do

      it "updates the requested company_sale" do
        company_sale = FactoryBot.create(:company_sale)
        put :update, {:id => company_sale.to_param, :company_sale => FactoryBot.attributes_for(:company_sale, buyer: "Empresa 2")}
        company_sale.reload
        expect(company_sale.buyer).to eq('Empresa 2')
      end

      it "redirects to the company_sale" do
        company_sale = FactoryBot.create(:company_sale)
        put :update, {:id => company_sale.to_param, :company_sale => FactoryBot.attributes_for(:company_sale)}
        expect(response).to redirect_to(CompanySale)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        company_sale = FactoryBot.create(:company_sale)
        put :update, {:id => company_sale.to_param, :company_sale => FactoryBot.attributes_for(:invalid_company_sale)}
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested company_sale" do
      company_sale = FactoryBot.create(:company_sale)
      expect {
        delete :destroy, {:id => company_sale.to_param}
      }.to change(CompanySale, :count).by(-1)
    end

    it "redirects to the company_sales list" do
      company_sale = FactoryBot.create(:company_sale)
      delete :destroy, {:id => company_sale.to_param}
      expect(response).to redirect_to(company_sales_url)
    end
  end

end
