class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :link, :photo_url, :membersInProject

  def photo_url
    if object.photo.attached?
      Rails.application.routes.url_helpers.rails_blob_path(object.photo, only_path: true)
    end
  end

  def membersInProject
    members = []
    object.project_members.each do |obj|
      if obj.member.photo.attached?
        member_photo_url = Rails.application.routes.url_helpers.rails_blob_path(obj.member.photo, only_path: true)
      end
      members.append(member_id: obj.member.id,  name: obj.member.name, photo_url: member_photo_url, project_role: obj.project_role.name)
    end
    return members
  end
end