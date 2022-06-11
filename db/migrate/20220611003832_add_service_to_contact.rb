class AddServiceToContact < ActiveRecord::Migration[6.1]
  def change
    add_column :contacts, :service, :string
  end
end
