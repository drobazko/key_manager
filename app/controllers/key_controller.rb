class KeyController < ApplicationController
  before_filter :authenticate_user!
  before_filter { redirect_to credentials_path if session[:master_key] }

  # GET /key
  def get
  end

  def send_key
    send_master_key
    redirect_to key_path
  end

  # POST /key/upload.js
  def upload
    @key = Key.new(key_params)
    render 'not_valid' and return unless @key.valid?
    session[:master_key] = params[:master_key]
    render js: "window.location='#{credentials_path}'"
  end

  private

  def key_params
    params.permit(:master_key)  
  end
end
