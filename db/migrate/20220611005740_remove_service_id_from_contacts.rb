class RemoveServiceIdFromContacts < ActiveRecord::Migration[6.1]
  def change
    remove_column :contacts, :service_id, :bigint
  end
end
