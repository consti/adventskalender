class HomeController < ApplicationController
  def placeholder
  end

  def kalender
    @days = Day.year(ENV['YEAR'])
  end
end
