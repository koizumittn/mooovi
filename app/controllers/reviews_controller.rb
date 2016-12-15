class ReviewsController < RankingController

  def new
    # form_forダグに渡すモデルインスタンスを生成
    @product = Product.find(params[:product_id])
    @review = Review.new
  end

end
