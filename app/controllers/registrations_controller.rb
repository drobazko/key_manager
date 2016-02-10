class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    send_master_key
    key_path(show_msg: :yes)
  end
end