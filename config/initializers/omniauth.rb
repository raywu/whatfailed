Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'XwxvmdOPvSza0gklqpliw', 'yL1adDZSS7vk3c01gmH4OpWMmSc39oySilAYS7d2RG0'
  provider :facebook, '132331646850398', '6816c59bc768d8e43ea08df55c49f28d'
end
