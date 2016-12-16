class ProductsController < RankingController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @products = Product.limit(20)
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    @products = Product.where('title LIKE ?', "%#{params[:keyword]}%").limit(20)
  end

end
