class Post < ActiveRecord::Base

	letsrate_rateable "post"
  has_many :comments
   belongs_to :users
  mount_uploader :image, ImageUploader

  attr_accessible :content, :name, :title, :gallery_id, :remote_image_url, :image, :user_id
  belongs_to :gallery

  accepts_nested_attributes_for :comments
end

