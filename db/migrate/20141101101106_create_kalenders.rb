class CreateKalenders < ActiveRecord::Migration
  def change
    create_table :kalenders do |t|
      t.integer :number
      t.references :prize, index: true

      t.timestamps
    end
  end
end
