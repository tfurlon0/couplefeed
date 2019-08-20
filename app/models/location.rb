class Location < ApplicationRecord
  # Direct associations

  has_many   :likes,
             :dependent => :nullify

  has_many   :comments,
             :dependent => :nullify

  has_many   :photos,
             :dependent => :nullify

  # Indirect associations

  # Validations

end
