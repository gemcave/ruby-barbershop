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

	if @username = ''
		@error = 'Введите имя'
	end
	if @phone = ''
		@error = 'Введите телефон'
	end
	if @datetime = ''
		@error = 'Введите дату и время'
	end
 
	if @error != ''
		return erb :visit
	end

	erb "#{@name}, спасибо вам! #{@color}"
end