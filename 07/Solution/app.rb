# require the file that sets everything up
require_relative 'boot'

get '/todos' do
   @todos = ToDo.order('completed ASC')
   erb :index, layout: :bootstrap 
end

get '/todos/new' do
   erb :new, layout: :bootstrap 
end

post '/todos' do
    @post = ToDo.new(params[:todo])
    @post.save
    redirect '/todos'
end