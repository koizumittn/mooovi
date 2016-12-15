class Product < ActiveRecord::Base

  has_many :reviews

  # レビューの平均評価を計算するメソッド
  def average_rate
    reviews.average(:rate).round
  end

end
