class KeyController < ApplicationController
	before_filter :authenticate_user!

	# GET /key
	def get
	end

	# GET /key/generate.js
	def generate
		session[:master_key_tmp] ||= SecureRandom.hex(24)
	end

	# POST /key/upload.js
	def upload
		@key = Key.new(key_params)
		render 'not_valid' unless @key.valid?
		session[:master_key] = params[:master_key]
	end

	# GET /key/download.js
	def download
		respond_to do |format|
		  format.js
		  format.txt { send_data session[:master_key_tmp], filename: "master_key.txt" }
		end
	end

	private

	def key_params
		params.permit(:master_key)	
	end
end
