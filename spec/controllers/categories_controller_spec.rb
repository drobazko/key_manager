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

		it "GET #index: assign a categories list" do
	      get :index
	      expect(assigns(:categories)).to eq([])
		end

		describe "POST create" do
			context "with valid attributes" do
				it "create a new category" do
					post :create, format: :js, category: {title: "My New Category"} 
					expect(response).to render_template(:create)
				end
			end

			context "with invalid attributes" do
				it "create a new category" do
					post :create, format: :js, category: {title: nil} 
					expect(response).to render_template(:errors)
				end
			end
		end

		describe "PUT update" do
			before(:each) do 
				@category = FactoryGirl.build(:category) 
				@category.user = @current_user
				@category.save
			end

			context "with valid attributes" do
				it "located the requested @contact" do 
					put :update, format: :js, id: @category, category: FactoryGirl.attributes_for(:category) 
					expect(assigns(:category)).to eq(@category)
				end
			end

			context "with invalid attributes" do
			end

		end

	end
end
