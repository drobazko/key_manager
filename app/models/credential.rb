class Credential < ActiveRecord::Base
	belongs_to :category
	belongs_to :user

	validates :name, :login, :password, presence: true

	attr_accessor :encryption_key

	attr_encrypted :login, key: :encryption_key
	attr_encrypted :password, key: :encryption_key

	EXPORT_FORMATS = [:pdf, :csv]
end
