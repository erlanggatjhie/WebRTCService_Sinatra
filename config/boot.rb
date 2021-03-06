require "bundler"
require "yaml"

# require "bundle gems"
ENV["RACK_ENV"] ||= "development"
Bundler.require(:default, ENV["RACK_ENV"].to_sym)
#
# # init database
DB = Sequel.connect(YAML.load_file("./config/database.yml")["default"]["url"])
#
# # init sinatra
set :sessions, true
set :session_secret, "some_session_secret"
set :root, File.expand_path(".")
set :views, settings.root + "/app/views"
#
# # sinatra reloader
if development?
  require "sinatra/reloader"
  also_reload "lib/**/*.rb", "app/{models,helpers}/**/*.rb"
end

# require project files
Dir.glob "./{lib,app/models,app/helpers,app/controllers}/**/*.rb" do |f|
  require f
end
