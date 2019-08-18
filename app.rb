require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "RubySchools.us"
end

get '/about' do
	@error = "что то пошло не так?"
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

	hh = {	:username => 'Введите имя',
					:phone => 'Введите телефон',
					:datetime => 'Введите дату и время'}
@error = hh.select {|key,_| params[key] == ''}.values.join(", ")

if @error != ''
	return erb :visit
end

	erb "#{@name}, спасибо вам! #{@datetime} - #{@color} - #{@barber}"
end
