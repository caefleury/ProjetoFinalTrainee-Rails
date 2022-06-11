class CreateProjectRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :project_roles do |t|
      t.string :name

      t.timestamps
    end
  end
end
