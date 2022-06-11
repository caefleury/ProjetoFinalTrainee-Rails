class AddLinkToProject < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :link, :string
  end
end
