class RemoveServiceFromContacts < ActiveRecord::Migration[6.1]
  def change
    remove_column :contacts, :service, :string
  end
end
