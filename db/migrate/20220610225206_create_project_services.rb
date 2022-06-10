class CreateProjectServices < ActiveRecord::Migration[6.1]
  def change
    create_table :project_services do |t|
      t.references :project, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
