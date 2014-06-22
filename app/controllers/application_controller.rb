class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	rescue_from OpenSSL::Cipher::CipherError, :with => :error_decryption_method

	def error_decryption_method
		session.delete(:master_key)
		respond_to do |type|
			type.html { redirect_to key_path, notice: "Bad Decryption Key. Load Proper Decryption Key." }
			type.all  { render :nothing => true, :status => 404 }
		end
		true
	end

	def load_key!
		redirect_to(key_path) unless session[:master_key]  
	end
end
