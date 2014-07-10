FactoryGirl.define do
	factory :user do
		email "drobazko@gmail.com"
		password "12345678"
	end

	factory :invalid_user, parent: :user do
		email nil
	end

	# This will use the User class (Admin would have been guessed)
	factory :admin, class: User do
	first_name "Admin"
	end
end