class AddLinkToPartner < ActiveRecord::Migration[6.1]
  def change
    add_column :partners, :link, :string
  end
end
