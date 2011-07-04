# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Whatfailed::Application

# The following is from http://blog.notdot.net/2009/10/Blogging-on-App-Engine-part-6-Comments-and-Search
# To use disqus for comments, set this to the 'short name' of the disqus forum
# created for the purpose.
# disqus_forum = None