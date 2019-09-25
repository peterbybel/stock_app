class UserFundsController < ApplicationController

  def create
    fund = Fund.find_by_ticker(params[:fund_ticker])
    if fund.blank?
      fund = Fund.new_from_lookup(params[:fund_ticker])
      fund.save
    end
    @user_fund = UserFund.create(user: current_user, fund: fund)
    flash[:success] = "Added #{@user_fund.fund.name} successfully!"
    redirect_to my_portfolio_path
  end

  def destroy
    fund = Fund.find(params[:id])
    @user_fund = UserFund.where(user_id: current_user.id, fund_id: fund.id).first
    @user_fund.destroy
    flash[:notice] = "Stock was successfully removed."
    redirect_to my_portfolio_path
  end
end
