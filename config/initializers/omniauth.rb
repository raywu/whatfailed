Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '240443122674939', 'df4fd18da2c46e5479d26a26ad76900b'
  provider :twitter, 'XwxvmdOPvSza0gklqpliw', 'yL1adDZSS7vk3c01gmH4OpWMmSc39oySilAYS7d2RG0'
end
