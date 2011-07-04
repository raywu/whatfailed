# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Whatfailed::Application

# To use disqus for comments, set this to the 'short name' of the disqus forum
# created for the purpose.
# disqus_forum = None