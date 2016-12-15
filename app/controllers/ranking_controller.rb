class RankingController < ApplicationController
  layout 'review_site'

  before_action :get_ranking

  def get_ranking
    @ranking = Product.limit(5)
  end
end
