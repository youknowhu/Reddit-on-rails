class Post < ApplicationRecord
  validates :title, :subs, :author, presence: true

  belongs_to :author,
  foreign_key: :author_id,
  class_name: :User

  has_many :post_subs

  has_many :subs,
  through: :post_subs,
  source: :sub


end
