class BackOffice::ProductsController < BackOfficeController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @products = current_user.products.all
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    if current_user.products.count == 0
      @product = Product.new({
        name: "Million Dollar Weekend: The Surprisingly Simple Way to Launch a 7-Figure Business in 48 Hours",
        incentive_description: "Get my special lead generation funnel for free 🎯",
        thank_you_title: "Thank you for your feedback!",
        thank_you_content: "Here is the link to the ebook: https://example.com"
      })
    else
      @product = Product.new
    end
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = current_user.products.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_url, notice: "Product was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to edit_product_url(@product), notice: "Product was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy!

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :thank_you_content, :thank_you_title, :incentive_description)
    end
end
