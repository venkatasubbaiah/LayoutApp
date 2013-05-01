OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '506295836093722', 'b194f74c4e257e934994c2bf727f14ff',{:scope =>'user_birthday, user_friends'}
end

