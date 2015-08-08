require "sinatra"

set :bind, '0.0.0.0'
set :server, 'webrick'

get '/' do
    erb :"index", layout: :"layouts/main"
end
