class CheckIn < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  belongs_to :location,
             :counter_cache => true

  belongs_to :owner,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

end
