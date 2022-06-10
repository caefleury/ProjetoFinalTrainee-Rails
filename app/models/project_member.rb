class ProjectMember < ApplicationRecord
  belongs_to :member
  belongs_to :project
  belongs_to :project_role
end
