class Category < ActiveRecord::Base
  has_many :credentials
  belongs_to :user

  validates :title, presence: true
  validates :title, uniqueness: true

  scope :list, -> (current_user) { where("user_id is null or user_id = ?", current_user).order(updated_at: :desc) }
end
