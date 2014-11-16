class DaysController < ApplicationController
  def show
    @day = Day.opened.find(params[:id])
    respond_to do |format|
      format.js
      # format.html
    end
  end
end
