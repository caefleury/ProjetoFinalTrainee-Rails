class AddDateToContact < ActiveRecord::Migration[6.1]
  def change
    add_column :contacts, :date, :datetime
  end
end
