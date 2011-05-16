class Photo < ActiveRecord::Base
  require Rails.root.join('app', 'uploaders', 'photo_uploader.rb')
  belongs_to :category
  mount_uploader :image, PhotoUploader
end
