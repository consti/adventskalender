module ApplicationHelper
  def display_winner_collection?
    Date.today > Date.parse("24.12.#{ENV['YEAR']}")
  end
end
