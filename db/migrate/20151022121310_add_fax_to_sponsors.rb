class AddFaxToSponsors < ActiveRecord::Migration
  def change
    add_column :sponsors, :fax, :string
  end
end
