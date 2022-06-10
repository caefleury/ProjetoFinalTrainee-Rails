class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :name
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
