class Public::ProductsController < ApplicationController
  before_action :set_product, only: %i[ show ]

  # GET /products/1 or /products/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end
end
