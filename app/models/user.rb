class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :children, dependent: :destroy

  validate :children_limit

  private

  def children_limit
    if self.children.size > 3
      errors.add(:children, "は3人まで登録できます")
    end
  end
end
