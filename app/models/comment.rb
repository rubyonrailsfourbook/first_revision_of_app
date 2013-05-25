class Comment < ActiveRecord::Base
  belongs_to :post

  belongs_to :user

  validates_presence_of :content

  validates_length_of :content, minimum: 20

  has_ancestry
end
