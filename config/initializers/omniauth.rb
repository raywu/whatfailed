Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'ml4npE0q6pEttXMj4BYmw', 'E3B4LsFU3aG6yJLVCSQPmRUKwnxiRUSQZGHa4yKok'
  provider :facebook, '240443122674939', 'df4fd18da2c46e5479d26a26ad76900b'
end
