require "sinatra"
require "sinatra/reloader"
require "geocoder"
require "forecast_io"
require "httparty"
def view(template); erb template.to_sym; end
before { puts "Parameters: #{params}" }                                     

# enter your Dark Sky API key here
ForecastIO.api_key = "043b254525084c12a2377cedb26aa925"


# news is now a Hash you can pretty print (pp) and parse for your output
#pp news

get "/" do
    url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=043b254525084c12a2377cedb26aa925"
news = HTTParty.get(url).parsed_response.to_hash

    @news=news
view "ask"
  # show a view that asks for the location
end

#get "/news" do
  # do everything else
#end