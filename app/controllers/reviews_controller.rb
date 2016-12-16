class ReviewsController < RankingController

  before_action :authenticate_user! , except: :create

  def new
    # form_forダグに渡すモデルインスタンスを生成
    @product = Product.find(params[:product_id])
    @review = Review.new
  end

  def create
    Review.create(create_params)
    redirect_to("/")
  end

  private
  def create_params
    params.require(:review).permit(:rate, :review).merge(:product_id => params[:product_id], :user_id => current_user.id)
  end

end
