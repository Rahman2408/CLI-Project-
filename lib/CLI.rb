class CLI
    def greeting
        puts  "Hi!".colorize(:yellow)
        puts "Welcome to your currency translator! Here, you can find out what your money means in a particular country or all over the world!".colorize(:yellow)
        puts "Please note that you can quit the application at any given time by entering 'exit' whenever being prompted for a response, or select it from an available list of options."
        self.default_iso
    end
   
    def default_iso
        puts "Please type the currency you currently use by its three-letter ISO code and press enter.".colorize(:yellow)
        puts "If you're unsure, simply type 'help' and press enter for a list of all countries with their corresponding code.".colorize(:yellow)      
        input = gets.upcase.strip
            if input == "HELP"
                TableMaker.legend_table
                puts "You can refer to the legend above to enter the ISO code.".colorize(:yellow)
                self.default_iso
            elsif CurrencyData.find_by_iso(input)
                API.get_currency(input) 
                rates = API.all
                self.options(input,rates)
            elsif input == "EXIT"
                exit
            else
                puts "Hmmm..I couldn't seem to understand that, lets try again.".colorize(:red)
                self.default_iso 
            end
        end

    def options(input1,rates)
        puts "With your default currency being the #{CurrencyData.find_by_iso(input1).name}.".colorize(:yellow)
        puts "What would you like to do next? Select one of the following by typing in its associated number and pressing enter:".colorize(:yellow)
        puts "1. Compare to another country's currency.".colorize(:green)
        puts "2. Compare to currencies all accross the world.".colorize(:green)
        puts "3. Start over.".colorize(:blue)
        puts "4. Exit.".colorize(:red)
        input = gets.upcase.strip
            if input == "1" 
                self.compare_to_other(input1,rates)
            elsif input == "2" 
                    self.compare_to_all(input1,rates)
            elsif input == "3"
                self.default_iso
            elsif input == "4" || input == "EXIT"
                exit
            else
                puts "Hmmm..I couldn't seem to understand that, lets try again.".colorize(:red)
                self.options(input1,rates)
        end 
    end
   
    def compare_to_other(input1,rates)
        puts "Please type and enter the three-letter ISO code for the country you'd like to compare yours to.".colorize(:yellow)
        puts "If you'd like to take another look at the legend, just type and enter 'help' again.".colorize(:yellow)
        input = gets.upcase.strip
        if input == "HELP"
            TableMaker.legend_table
            puts "Refer to the list above to find the code for the country you'd like to compare your currency to.".colorize(:yellow)
            self.compare_to_other
        elsif CurrencyData.find_by_iso(input)
            country = CurrencyData.find_by_iso(input)
            country1 = CurrencyData.find_by_iso(input1)
            puts "Nice! You're looking to compare your money to #{country.name}s.".colorize(:yellow) 
            puts "Here are your details:".colorize(:yellow)
            TableMaker.find_details_table(input1, input, rates)
            self.options(input1,rates)
        elsif input == "EXIT"
             exit
        else
             puts "Hmmm..I couldn't seem to understand that, lets try again.".colorize(:red)
             self.compare_to_other(input1,rates)
        end
    end

    def compare_to_all(input1,rates)
    TableMaker.all_table(input1,rates)
    self.options(input1,rates)
    end
end

