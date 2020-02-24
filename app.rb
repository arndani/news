require "sinatra"
require "sinatra/reloader"
require "geocoder"
require "forecast_io"
require "httparty"

def view(template); erb template.to_sym; end
before { puts "Parameters: #{params}" }                                     


      ForecastIO.api_key = "599ea1f85ac191f31ea5460abe64d084"
    url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=00daa4473b72423cbee7e2e223f861ac"
    news = HTTParty.get(url).parsed_response.to_hash
    

get "/" do

     #url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=00daa4473b72423cbee7e2e223f861ac"
    #news = HTTParty.get(url).parsed_response.to_hash
# news is now a Hash you can pretty print (pp) and parse for your output

     #pp news
view "ask"
end

get "/news" do
  results = Geocoder.search(params["q"])
    lat_long = results.first.coordinates # => [lat, long]
    
    
    #@lat_long="#{lat_long[0]}, #{lat_long[1]}"
   @lat="#{lat_long[0]}"
    @long="#{lat_long[1]}"
  
 @forecast = ForecastIO.forecast(@lat, @long).to_hash
    @current_temp=@forecast["currently"]["temperature"]




# high_temperature = forecast["daily"]["data"][0]["temperatureHigh"]
# puts high_temperature
# puts forecast["daily"]["data"][1]["temperatureHigh"]
# puts forecast["daily"]["data"][2]["temperatureHigh"]




end




  
    
   # view "ask"

    #results = Geocoder.search("Evanston, IL")
