require_relative '../config/environment'

class UI
    def greeting
        puts  "Hi!" 
        sleep(1)
        puts "Welcome to Currency Currently!"
        
    end

    def user_from
        puts "start point?"
        # input = gets.strip 
        # @@start_point = input
        start_point = "New York, NY"
    end

    def user_to
        puts "end point?"
        # input2 = gets.strip
        # @@end_point = input2
        end_point = "San Diego, CA"
    end
 
#    def self.starting
#     self.user_from
#    end
   
#    def self.ending
#     self.user_to
#    end
# binding.pry
end