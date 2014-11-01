class CreatePrizes < ActiveRecord::Migration
  def change
    create_table :prizes do |t|
      t.references :sponsor, index: true
      t.references :day, index: true
      t.string :name

      t.timestamps
    end
  end
end
