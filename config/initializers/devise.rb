Devise.setup do |config|
    config.navigational_formats = [ :json ]
    config.sign_out_via = :get
    # Invalidates all the remember me tokens when the user signs out.
    config.expire_all_remember_me_on_sign_out = true
end