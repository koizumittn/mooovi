class RankingController < ApplicationController
  layout 'review_site'

  before_action :get_ranking

  def get_ranking
    @ranking = Review.group(:product_id).order('count_product_id DESC').count(:product_id).keys.map{|product_id| Product.find(product_id)}
  end
end
