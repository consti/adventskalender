class ChangeNumberColumnInKalenders < ActiveRecord::Migration
  def change
    change_column :kalenders, :number, :bigint
  end
end
