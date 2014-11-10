class HomeController < ApplicationController
  def placeholder
  end

  def kalender
    @days = Day.all
  end
end
