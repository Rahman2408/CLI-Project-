class DataHandler
 
  def self.find_details_table(input)
     rows=
     CurrencyData.all.values_at(input).first.to_a do|key, value|
     currency=[]
     currency << key[value]
     currency.transpose.flatten!(1)
  end
  rows=rows.to_a
      table = Terminal::Table.new :title => "Currency of Interest".colorize(:yellow), :headings => ['Attributes'.colorize(:red), 'Details'.colorize(:green)], :rows => rows
      puts table  
  end

  def self.find_by_code
        CurrencyData.all.collect do|key, value|
        currency_hash = {}
        currency_hash[value["name"]] = key.upcase
        currency_hash
        end   
  end
  
  def self.info_by_country
        CurrencyData.all.collect do|key ,value|
        currency_hash = Hash.new
        currency_hash[value["name"]]=value
        currency_hash
        end   
  end
  def self.legend_table
        rows = []
        
        self.find_by_code.map do |key ,value|
        countries = []
        countries << key.first 
        rows << countries.transpose.flatten!(1)
        end        
    
        table = Terminal::Table.new :title => "Currency Legend".colorize(:green), :headings => ['Country'.colorize(:red), 'ISO Code'.colorize(:yellow)], :rows => rows
        puts table 
  end
  def self.response_table
    rows = []

    API.all_formatted.map do |key ,value|
    countries = []
    countries << key.first 
     rows << countries.transpose.flatten!(1)
    end        
    
    table = Terminal::Table.new :title => "Exchange Rates".colorize(:red), :headings => ['Country'.colorize(:yellow), 'Value'.colorize(:green)], :rows => rows
    puts table 
  end
end
      



