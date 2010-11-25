SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :api_key, 'API Key', api_key_path
    primary.item :lists, 'MailChimp Lists', lists_path, :if => lambda { api_key.present? }
    primary.item :users, 'Users', users_path
  end
end
