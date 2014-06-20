class Credential < ActiveRecord::Base
	has_one :link
	belongs_to :category

	attr_accessor :encryption_key

	attr_encrypted :pass, key: :encryption_key

end
