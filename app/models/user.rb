class User < ApplicationRecord
  # Direct associations

  has_many   :likes,
             :foreign_key => "author_id",
             :dependent => :destroy

  has_many   :comments,
             :foreign_key => "author_id",
             :dependent => :destroy

  has_many   :photos,
             :foreign_key => "author_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
