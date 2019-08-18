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

	hh.each do |key, value|
		if params[key] = ''
			@error = hh[key]
			return erb :visit
		end
	end	

	erb "#{@name}, спасибо вам! #{@datetime} - #{@color} - #{@barber}"
end