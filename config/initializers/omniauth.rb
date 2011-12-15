Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '297086536985505', '23635e929086f8860f2ed82678ad790d'
  provider :twitter, 'XwxvmdOPvSza0gklqpliw', 'yL1adDZSS7vk3c01gmH4OpWMmSc39oySilAYS7d2RG0'
  provider :identity, on_failed_registration: lambda { |env|
    IdentitiesController.action(:new).call(env)
  }
end
