# Load the rails application
require File.expand_path('../application', __FILE__)

Paperclip.options[:command_path] = "/usr/local/bin/convert"

# Initialize the rails application
Obced::Application.initialize!
