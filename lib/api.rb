 require_relative '../config/environment'



class API
    
    def request_api

        puts "type now"

            input = gets.chomp
       
        url = "https://v6.exchangerate-api.com/v6/33f2da155e168492df119fc3/latest/#{input}"
        #"https://www.dictionaryapi.com/api/v3/references/collegiate/json/#{input}?key=3784bbaf-b108-4c3f-ad79-0652697067bf"

        json = HTTParty.get(url)
  
    end
end
