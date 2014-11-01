class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :name
      t.string :person
      t.string :address
      t.string :city
      t.string :phone
      t.string :logo

      t.timestamps
    end
  end
end
