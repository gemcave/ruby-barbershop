require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

configure do
	db = SQLite3::Database.new 'barbershop.db'
	db.execute 'CREATE TABLE IF NOT EXISTS "Messages"
    (
      "id" INTEGER PRIMARY KEY AUTOINCREMENT,
      "username" TEXT,
      "phone" TEXT,
      "email" TEXT,
      "option" TEXT,
      "comment" TEXT
    )'

end

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
