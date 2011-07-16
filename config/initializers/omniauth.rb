Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'ml4npE0q6pEttXMj4BYmw', 'E3B4LsFU3aG6yJLVCSQPmRUKwnxiRUSQZGHa4yKok'
  provider :facebook, '132331646850398', '6816c59bc768d8e43ea08df55c49f28d'
end