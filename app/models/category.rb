class Category < ActiveRecord::Base
	has_many :credentials
	belongs_to :user

	validates :title, presence: true
	validates :title, uniqueness: true
end
