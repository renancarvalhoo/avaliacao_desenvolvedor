class CompanySalesController < ApplicationController
  before_action :set_company_sale, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @company_sales = CompanySale.all
  end

  def show
  end

  def new
    @company_sale = CompanySale.new
  end

  def edit
  end

  def create
    @company_sale = CompanySale.new(company_sale_params)

    if @company_sale.save
      respond_to do |format|
        format.html { redirect_to :company_sales }
        format.json { render json: @company_sale.as_json }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: { errors: @company_sale.errors.full_messages } }
      end
    end

  end

  def update

    if @company_sale.update(company_sale_params)
      respond_to do |format|
        format.html { redirect_to :company_sales }
        format.json { render json: @company_sale.as_json }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: { errors: @company_sale.errors.full_messages } }
      end
    end
  end

  def import
    binding.pry
    if Report::File.new(company_sale_import_params).parse
      flash[:success] = "Importação realizada com sucesso."
      redirect_to :company_sales
    else
      flash[:danger] = "Não foi possível realizar a importação do arquivo."
      redirect_to :company_sales
    end
  end

  def upload
  end

  def destroy
    @company_sale.destroy
    redirect_to :company_sales
  end

  private

  def set_company_sale
    @company_sale = CompanySale.find(params[:id])
  end

  def company_sale_params
    params.require(:company_sale).permit(:buyer, :description, :unit_price, :quantity, :address, :supplier)
  end

  def company_sale_import_params
    params.require(:company_sale).permit(:file)
  end
end
