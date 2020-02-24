require "sinatra"
require "sinatra/reloader"
require "geocoder"
def view(template); erb template.to_sym; end
before { puts "Parameters: #{params}" }                                     

   # url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=00daa4473b72423cbee7e2e223f861ac"
    #news = HTTParty.get(url).parsed_response.to_hash


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
   @lat =lat_long[0]} 
    @long-lat_long[1]
end

#Shows the news output

  
    
   # view "ask"

    #results = Geocoder.search("Evanston, IL")
