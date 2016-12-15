class ProductsController < RankingController

  def index
    @products = Product.limit(20)
  end

end
