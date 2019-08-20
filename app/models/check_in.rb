class CheckIn < ApplicationRecord
  # Direct associations

  belongs_to :location,
             :counter_cache => true

  belongs_to :owner,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

end
