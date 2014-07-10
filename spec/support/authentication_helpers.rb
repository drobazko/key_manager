module AuthenticationHelpers

=begin
  def sign_in(user)
    sign_in_to_facebook(user)
    visit log_in_path
    within ".facebook" do
      click_link "Log in"
    end
  end
=end

end

RSpec.configure do |c|
  c.include AuthenticationHelpers, type: :request
end
