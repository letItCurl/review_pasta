class BackOffice::FeedbacksController < BackOfficeController
  def index
  end

  def show
    @feedback = current_user.products.where(id: params[:id]).first.feedbacks.find(params[:feedback_id])
  end

  # GET /feedbacks/new
  def new
    @feedback = Feedback.new
  end

  # POST /feedbacks or /feedbacks.json
  def create
    @feedback = current_user.feedbacks.new(feedback_params)

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to authenticated_root_path, notice: "Feedback was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def feedback_params
      params.require(:feedback).permit(:feedback_type, :content, :rating)
    end
end
