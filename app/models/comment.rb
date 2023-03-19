class Comment < ApplicationRecord
  belongs_to :story
  belongs_to :user
  has_rich_text :body
end
