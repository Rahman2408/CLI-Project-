require_relative '../config/environment'

class UI
    @@input
    
    
    def greeting
        puts  "Hi!" 
        sleep(1)
        puts "Welcome to your currency tranlslator! Here, you can find out what your money means in a particular country or all over the world!" 
        sleep(1)
        self.currency_info
    end

    def currency_info
        sleep(1)
        puts "Please enter the currency you currently use by its three-letter ISO code and would like to compare others to."
        sleep(1)
        puts "If you're unsure, simply type 'help' for a list of all countries with their code."
        @@input = gets.strip
            
            if @@input == "help"
                puts Database.legend
                sleep(1)
                puts "Refer to the legend above and enter your ISO code."
                sleep(1)
                @@input = gets.strip
                response = API.get_currency(@@input)
                self.next_step(response)
            elsif Database.all.has_key?(@@input) 
              response = API.get_currency(@@input)
                self.next_step(response)
            elsif @@input == "exit"
                exit
            
            else
                puts "Hmmm..I couldn't seem to understand that, lets try again."
                self.currency_info 
                
            end
    end

    def next_step(data)
       
    end
    

end