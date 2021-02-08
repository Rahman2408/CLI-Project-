require_relative '../config/environment'

class CLI
    @@input
    
    
    def greeting
        puts  "Hi!".colorize(:yellow) 

        puts "Welcome to your currency translator! Here, you can find out what your money means in a particular country or all over the world!".colorize(:yellow)
        puts "Please note that you can quit the application at any given time by entering 'exit' whenever being prompted for a response, or select it from an available list of options."
        sleep(2)
        self.currency_info
    end

    def currency_info
        puts "Please type the currency you currently use by its three-letter ISO code and press enter.".colorize(:yellow)
        puts "If you're unsure, simply type 'help' and press enter for a list of all countries with their corresponding code.".colorize(:yellow)      
        @@input = gets.downcase.strip
            if @@input == "help"
                DataHandler.legend_table
                puts "You can refer to the legend above to enter the ISO code.".colorize(:yellow)
                sleep(1)
                self.currency_info
            elsif DataHandler.all.has_key?(@@input) 
                response = API.get_currency(@@input) 
                self.options(response)
            elsif @@input == "exit"
                exit
            else
                puts "Hmmm..I couldn't seem to understand that, lets try again.".colorize(:red)
                self.currency_info 
            end
  
        end

    def options(data)
        puts "Your native currency is the #{DataHandler.all["#{@@input}"]["name"]}.".colorize(:yellow)
        sleep(1)
        puts "What would you like to do next? Select one of the following by typing in its associated number and pressing enter:".colorize(:yellow)
        puts "1. Compare to another country's currency.".colorize(:green)
        puts "2. Compare to currencies all accross the world.".colorize(:green)
        puts "3. Start over.".colorize(:blue)
        puts "4. Exit.".colorize(:red)
        input = gets.strip
            if input == "1" 
                self.compare_to_other
            elsif input == "2"
                self.compare_to_all
            elsif input == "3"
                self.currency_info
            elsif input == "4" || input == "exit"
                exit
            else
                puts "Hmmm..I couldn't seem to understand that, lets try again.".colorize(:red)
                self.options(@@input)
        end 
    end
    def compare_to_other
        puts "Please type and enter the three-letter ISO code for the country you'd like to compare yours to.".colorize(:yellow)
        puts "If you'd like to take another look at the legend, just type and enter 'help' again.".colorize(:yellow)
        sleep(2)
        input = gets.downcase.strip
        if input == "help"
            DataHandler.legend_table
            sleep(1)
            puts "Refer to the list above to find the code for the country you'd like to compare your currency to.".colorize(:yellow)
            self.compare_to_other
        elsif DataHandler.all.has_key?(input)
            puts "Nice! You're looking to compare to #{DataHandler.all["#{input}"]["name"]}s.".colorize(:yellow)
            sleep(1)
            puts "Each #{DataHandler.all["#{@@input}"]["name"]} is equal to #{API.all[input.upcase]} #{DataHandler.all["#{input}"]["name"]}s.".colorize(:green) 
            sleep(2) 
            puts "Now that you know the actual value of #{DataHandler.all["#{input}"]["name"]}s, here are some more details specific to the currency:".colorize(:yellow)
            sleep(2)
            DataHandler.find_details_table(input)
            sleep(3)
            self.options(@@input)
        elsif input == "exit"
             exit
        else
             puts "Hmmm..I couldn't seem to understand that, lets try again.".colorize(:red)
             self.compare_to_other 
        end
    end

    def compare_to_all
    DataHandler.response_table
    self.options(@@input)
    end
end

