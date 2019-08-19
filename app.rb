require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

def get_db
	db = SQLite3::Database.new 'barbershop.db'
	db.results_as_hash = true
	return db
end

configure do
	db = get_db
	db.execute 'CREATE TABLE IF NOT EXISTS
	"Users"
    (
      "id" INTEGER PRIMARY KEY AUTOINCREMENT,
      "username" TEXT,
      "phone" TEXT,
      "datestamp" TEXT,
      "barber" TEXT,
      "color" TEXT
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

	db = get_db
	db.execute 'insert into
				Users
				(
					username,
					phone,
					datestamp,
					barber,
					color
				)
				values (?,?,?,?,?)', [@name,@phone,@datetime,@barber,@color]

	erb "#{@name}, спасибо вам! #{@datetime} - #{@color} - #{@barber}"
end

get '/showusers' do
	db = get_db

	@results = db.execute 'select * from Users order by id desc'

	erb :showusers
end