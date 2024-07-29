class Child < ApplicationRecord
  belongs_to :users
  
  validates :name, length: { maximum: 10 }, format: { with: /\A[^\x01-\x7E]+\z/, message: "は全角文字のみで入力してください" }
  validates :name, uniqueness: { scope: :user_id } 
end
