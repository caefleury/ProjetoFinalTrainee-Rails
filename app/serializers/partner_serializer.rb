class PartnerSerializer < ActiveModel::Serializer
  attributes :name, :photo_url, :link

  def photo_url
    if object.photo.attached?
      Rails.application.routes.url_helpers.rails_blob_path(object.photo, only_path: true)
    end
  end
end
