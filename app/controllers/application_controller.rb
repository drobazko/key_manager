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

  def after_sign_in_path_for(resource)
    key_path
  end

  def after_sign_out_path_for(resource)
    session[:master_key] = nil
    root_path
  end

  private

  def send_master_key
    session[:master_key_tmp] ||= SecureRandom.hex(24)
    CredentialMailer.master_key(current_user, session[:master_key_tmp]).deliver
  end
end
