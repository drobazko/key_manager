FactoryGirl.define do
	factory :user do
		email "drobazko@yahoo.com"
		password "12345678"
	end

	factory :invalid_user, parent: :user do
		email nil
		password nil
	end

	factory :category do
		title "My Test Category"
	end

	factory :invalid_category, parent: :category do
		title "My Test Category"
	end
end