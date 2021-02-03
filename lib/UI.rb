require_relative '../config/environment'

class UI
@@start_point
@@end_point
    def greeting
    
        puts  "Hi!" 
        sleep(1)
        puts "Welcome to the map!"
    end

    def user_from
        puts "start point?"
        input = gets.strip 
        @@start_point = input
    end

    def user_to
        puts "end point?"
        input2 = gets.strip
        @@end_point = input2
    end
 
   def self.start
    @@start_point
   end
   
   def self.end
    @@end_point
   end

end