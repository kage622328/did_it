class User < ApplicationRecord
  #authenticates_with_sorcery!
  has_many :children, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validate :children_limit

  private

  def children_limit
    if self.children.size > 3
      errors.add(:children, "は3人まで登録できます")
    end
  end
end
