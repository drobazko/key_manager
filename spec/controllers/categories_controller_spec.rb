require 'rails_helper'
require 'spec_helper'

describe CategoriesController, :type => :controller do
	login_user
	context "without security key" do
		#u = FactoryGirl.build(:invalid_user) <===== useful for testing models

		it "list of categories should redirect" do
	      get :index
	      expect(response).to redirect_to(key_path)
		end
	end

	context "with security key" do
		before(:each) { request.session[:master_key] = SecureRandom.hex(24) }

		it "GET #index" do
	      get :index
	      expect(response).to render_template(:index)
		end

		it "create a new category" do
		  request.session[:master_key] = SecureRandom.hex(24)
		  post :create, format: :js, category: {title: "My New Category"} 
		end
	end
end
