class UsersController < ApplicationController

  def show
    @user = User.find(current_user.id)
    @reviews = @user.reviews.order('created_at DESC')
  end

end
