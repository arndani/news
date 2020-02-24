require "sinatra"
require "sinatra/reloader"
require "geocoder"
require "forecast_io"
require "httparty"
def view(template); erb template.to_sym; end
before { puts "Parameters: #{params}" }                                     

# enter your Dark Sky API key here

  ForecastIO.api_key = "599ea1f85ac191f31ea5460abe64d084"
 


get "/" do
  # show a view that asks for the location

     url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=00daa4473b72423cbee7e2e223f861ac"
    news = HTTParty.get(url).parsed_response.to_hash
        @news=news

  view "ask"
end

#get "/news" do
  # do everything else
#end