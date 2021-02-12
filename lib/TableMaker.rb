class TableMaker
 
  def self.find_details_table(input1,input,rates)
      info1 = CurrencyData.find_by_iso(input1)
      info = CurrencyData.find_by_iso(input)
      # binding.pry
      rows = 
      [["Value", rates[info1.iso_code], rates[info.iso_code]],
       ["ISO Code", info1.iso_code, info.iso_code],
       ["Symbol" , info1.symbol, info.symbol],
       ["Subunit", info1.subunit, info.subunit],
       ["# of Subunits to = 1", "#{info1.subunit_to_unit} #{info1.subunit}s","#{info.subunit_to_unit} #{info.subunit}s"]]
      table = Terminal::Table.new :title => "Results".colorize(:red), :headings => ['Details'.colorize(:red), info1.name.colorize(:yellow), info.name.colorize(:green)], :rows => rows
      puts table  
  end

  def self.legend_table
      rows = CurrencyData.currencies.collect do |c|
             arry=[c.name, c.iso_code]
             arry
       end
        table = Terminal::Table.new :title => "Currency Legend".colorize(:green), :headings => ['Country'.colorize(:red), 'ISO Code'.colorize(:yellow)], :rows => rows
        puts table 
  end


  def self.all_table(input1,rates)
      info1 = CurrencyData.find_by_iso(input1)
      get_countries_from_rate_codes = rates.each_key{|k| CurrencyData.find_by_iso(k) }
      known_countries = CurrencyData.currencies.collect(&:name)
      rows =
      CurrencyData.currencies.collect do |c|
            arry=[c.name,rates[c.iso_code]]
            arry
      end
    table = Terminal::Table.new :title => "Currency Values for each #{info1.name}".colorize(:red), :headings => ['Country'.colorize(:yellow), 'Value'.colorize(:green)], :rows => rows
    puts table 
  end
end
      



