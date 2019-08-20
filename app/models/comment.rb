class Comment < ApplicationRecord
  # Direct associations

  belongs_to :location,
             :required => false,
             :counter_cache => true

  belongs_to :photo,
             :required => false,
             :counter_cache => true

  belongs_to :author,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

end
