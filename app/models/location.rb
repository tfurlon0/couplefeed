class Location < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  has_many   :check_ins,
             :dependent => :destroy

  has_many   :likes,
             :dependent => :nullify

  has_many   :comments,
             :dependent => :nullify

  has_many   :photos,
             :dependent => :nullify

  # Indirect associations

  # Validations

end
