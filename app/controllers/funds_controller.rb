class FundsController < ApplicationController

  def search
    if params[:fund].blank?
      flash.now[:danger] = "You have entered an empty search string."
    else
      @fund = Fund.new_from_lookup(params[:fund])
      flash.now[:danger] = "No stock matches your search criteria." unless @fund
    end
    respond_to do |format|
      format.js {render partial: 'users/result'}
    end
  end
end
