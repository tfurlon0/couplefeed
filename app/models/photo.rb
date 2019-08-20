class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  belongs_to :location,
             :required => false,
             :counter_cache => true

  has_many   :likes,
             :dependent => :destroy

  has_many   :comments,
             :dependent => :destroy

  belongs_to :author,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

end
