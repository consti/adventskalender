class AddAnzahlToPrizes < ActiveRecord::Migration
  def change
    add_column :prizes, :anzahl, :integer
  end
end
