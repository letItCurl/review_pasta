class Public::FeedbacksController < ApplicationController
  before_action :find_product, only: [ :new, :create ]

  # GET /feedbacks/new
  def new
    @feedback = @product.feedbacks.new
  end

  # POST /feedbacks or /feedbacks.json
  def create
    @feedback = @product.feedbacks.new(feedback_params)

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to public_product_path(@product), notice: "Feedback was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private
    def find_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def feedback_params
      params.require(:feedback).permit(:feedback_type, :content, :rating, :email, :file)
    end
end
