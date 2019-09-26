class UsersController < ApplicationController

  def my_portfolio
    @user = current_user
    @user_funds = current_user.funds
  end

  def my_friends
    
  end
end
