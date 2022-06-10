class CreateProjectMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :project_members do |t|
      t.references :member, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.references :project_role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
