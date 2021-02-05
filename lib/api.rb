 require_relative '../config/environment'



class API
    @@url = "https://v6.exchangerate-api.com/v6/33f2da155e168492df119fc3/latest/#{input}"
    
    def get_currency(input)  
       response = HTTParty.get(@@url) 
       all_currencies = {response["conversion_rates"]}
       Data.new(all_currencies)
    end
end
