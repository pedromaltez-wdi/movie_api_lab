# require 'active_support/all'
require 'sinatra'
require 'httparty'
require 'json'

# get '/movie_search' do


# 	"http://www.omdbapi.com/?t="



# 	movie_title = request.POST["movie_title"]


# 	erb :stock, locals: { ticker: movie_title }


# 	erb :movie_search, locals: { none: none }

# end


get '/movie' do

	if params[:title] then
		name = params[:title].gsub(' ', '+')
		url = "http://www.omdbapi.com/?t=#{name}"
		html = HTTParty.get(url)
		@hash = JSON(html)
	end

	erb :movie, locals: { title: @hash }

end




# ==============
# Standard Pages
# ==============

get '/' do
	erb :home_page
end


get '/about' do
	erb :about
end

get '/faq' do
	erb :faq
end























