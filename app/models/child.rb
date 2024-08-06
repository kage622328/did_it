class Child < ApplicationRecord
  belongs_to :user
  has_one :coin, dependent: :destroy
  has_many :lists, dependent: :destroy
  has_many :completed_tasks, dependent: :destroy

  validates :name, length: { maximum: 10 }, format: { with: /\A[^\x01-\x7E]+\z/, message: "は全角文字のみで入力してください" }
  validates :name, uniqueness: { scope: :user_id }
  
  validate :lists_limit

  private

  def lists_limit
    if self.lists.size > 3
      errors.add(:lists, "は3個まで登録できます")
    end
  end
end
