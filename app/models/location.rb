class Location < ApplicationRecord
  # Direct associations

  has_many   :photos,
             :dependent => :nullify

  # Indirect associations

  # Validations

end
