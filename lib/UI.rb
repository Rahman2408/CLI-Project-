require_relative '../config/environment'

class UI
    def greeting
        puts  "Hi!" 
        sleep(1)
        puts "Welcome to your currency tranlslator! Here, you can find out what your money means in a particular country or all over the world!"  
    end

    def currency_codes
         
    end

    def input
        puts "What is the currency you currently use and would like to compare others to?"
        input = gets.strip
        respnse = API.get_currency(input)
        # self.use_data(response)
        # binding.pry 
    end

    def use_data(data)

   
    end
 

end