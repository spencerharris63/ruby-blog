class Comment < ApplicationRecord
  validates :author, :presence => true
  validates :body, :presence => true, length: { maximum: 250 }
  # validates :email, :presence => true, format: { with: URI::MailTo::EMAIL_REGEXP }
  belongs_to :post
end
