class Post < ApplicationRecord
  validates :title, :sub, :author, presence: true

  belongs_to :sub

  belongs_to :author,
  foreign_key: :author_id,
  class_name: :User
  
end
