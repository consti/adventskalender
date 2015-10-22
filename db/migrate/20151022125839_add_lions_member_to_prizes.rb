class AddLionsMemberToPrizes < ActiveRecord::Migration
  def change
    add_column :prizes, :lions_member, :string
  end
end
