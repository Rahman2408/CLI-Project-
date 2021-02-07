require_relative '../config/environment'

class CLI
    @@input
    
    
    def greeting
        puts  "Hi!".colorize(:blue) 
        sleep(1)
        puts "Welcome to your currency tranlslator! Here, you can find out what your money means in a particular country or all over the world!".colorize(:blue)
        sleep(2)
        self.currency_info_greet
    end

    def currency_info_greet
        puts "Please type the currency you currently use by its three-letter ISO code and press enter.".colorize(:blue)
        sleep(1)
        puts "If you're unsure, simply type 'help' and press enter for a list of all countries with their corresponding code.".colorize(:yellow)
        self.currency_info
    end

    def currency_info
        
        @@input = gets.downcase.strip
            
            if @@input == "help"
                ap Database.find_by_code
                sleep(1)
                puts "Please refer to the legend above to enter your ISO code.".colorize(:yellow)
                sleep(1)
                self.currency_info
            elsif Database.all.has_key?(@@input) 
                response = API.get_currency(@@input)
                self.options(response)
            elsif @@input == "exit"
                exit
            else
                puts "Hmmm..I couldn't seem to understand that, lets try again.".colorize(:red)
                self.currency_info_greet 
            end
    end

    def options(data)
        puts "Your native currency is the #{Database.all["#{@@input}"]["name"]}.".colorize(:blue)
        sleep(1)
        puts "What would you like to do next? Select one of the following by typing in its associated number and pressing enter:".colorize(:blue)
        puts "1. Compare to another country's currency.".colorize(:green)
        puts "2. Compare to currencies all accross the world.".colorize(:green)
        puts "3. Start over.".colorize(:yellow)
        puts "4. Exit.".colorize(:red)
        input = gets.strip
            if input == "1" 
                self.compare_to_other_greet
            elsif input == "2"
                self.compare_to_all
            elsif input == "3"
                self.currency_info_greet
            elsif input == "4"
                exit
            else
                puts "Hmmm..I couldn't seem to understand that, lets try again.".colorize(:red)
                self.options(@@input)
        end 
    end
    
    def compare_to_other_greet
        puts "Okay, please type and enter the three-letter ISO code for the country you'd like to compare yours to.".colorize(:blue)
        puts "If you'd like to take another look at the legend, just type and enter 'help' again.".colorize(:yellow)
        sleep(2)
        self.compare_to_other
    end

    def compare_to_other    
        input = gets.downcase.strip
        if input == "help"
            puts Database.find_by_code
            sleep(1)
            puts "Refer to the list above to find the code for the country you'd like to compare your currency to.".colorize(:yellow)
            self.compare_to_other
        elsif Database.all.has_key?(input)
            puts "Nice! You're looking to compare to #{Database.all["#{input}"]["name"]}s.".colorize(:blue)
            sleep(1)
            puts "Each #{Database.all["#{@@input}"]["name"]} is equal to #{API.all[input.upcase]} #{Database.all["#{input}"]["name"]}s.".colorize(:green) 
            sleep(2) 
            puts "Now that you know the actual value of #{Database.all["#{input}"]["name"]}s, here's some more details specific to the currency:".colorize(:blue)
            sleep(2)
            ap Database.all[input]
            sleep(3)
            self.options(@@input)
        elsif input == "exit"
             exit
        else
             puts "Hmmm..I couldn't seem to understand that, lets try again.".colorize(:red)
             self.compare_to_other_greet 
        end
    end

    def compare_to_all
       ap API.all_formatted
    self.options(@@input)
    end
end

 # input.split.map(&:capitalize).join(' ')