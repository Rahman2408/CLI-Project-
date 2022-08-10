class API
 
    attr_accessor :url, :response, :currency

    def initialize(input)
        @url = "https://v6.exchangerate-api.com/v6/33f2da155e168492df119fc3/latest/#{input}"
        @response = HTTParty.get(@url)
        @@currency =response["conversion_rates"]
    end
    # @@all_currencies
    
    # def self.get_currency(input)  
    #     url = "https://v6.exchangerate-api.com/v6/33f2da155e168492df119fc3/latest/#{input}"
    #     response = HTTParty.get(url) 
    #     @@all_currencies = response["conversion_rates"]
    # end
    
    def self.all
        @@currency
    end
end
