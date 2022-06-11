class CreateContactServices < ActiveRecord::Migration[6.1]
  def change
    create_table :contact_services do |t|
      t.references :service, null: false, foreign_key: true
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
