class AddCostToPrizes < ActiveRecord::Migration
  def change
    add_column :prizes, :cost, :integer
  end
end
