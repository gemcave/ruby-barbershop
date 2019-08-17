require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "RubySchools.us"
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit 
end

post '/visit' do
	@name = params[:name]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]
	@color= params[:colorpicker]

	erb "#{@name}, спасибо вам! #{@color}"
end