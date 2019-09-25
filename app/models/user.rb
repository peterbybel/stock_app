class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_funds
  has_many :funds, through: :user_funds

  def fund_already_added?(ticker_symbol)
    fund = Fund.find_by_ticker(ticker_symbol)
    return false unless fund
    user_funds.where(fund_id: fund.id).exists?
  end

  def under_fund_limit?
    (user_funds.count < 10)
  end

  def can_add_fund?(ticker_symbol)
    under_fund_limit? && !fund_already_added?(ticker_symbol)
  end
end
