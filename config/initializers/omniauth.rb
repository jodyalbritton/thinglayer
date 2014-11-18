Rails.application.config.middleware.use OmniAuth::Builder do
  provider :smartthings, ENV['ST_CLIENT_ID'], ENV['ST_CLIENT_SECRET'], {:scope => 'app'}
  provider :ubi, ENV['UBI_CLIENT_ID'], ENV['UBI_CLIENT_SECRET']
  provider :wink, ENV['WINK_CLIENT_ID'], ENV['WINK_CLIENT_SECRET']
end