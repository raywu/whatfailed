Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '240443122674939', 'e4e37fa8a612b468ef2060a825bcd8ea'
  provider :twitter, 'XwxvmdOPvSza0gklqpliw', 'yL1adDZSS7vk3c01gmH4OpWMmSc39oySilAYS7d2RG0'
end
