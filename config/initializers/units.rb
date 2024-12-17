Unit.define('wh') do |unit|
  unit.definition = Unit.new('3600 joules')
  unit.aliases = %w{Wh watt_hour}
  unit.display_name = 'watt hour'
end

Unit.define('kWh') do |unit|
  unit.definition = Unit.new('1000 Wh')
  unit.aliases = %w{kWh kilowatt_hour}
end

Unit.define('mwh') do |unit|
  unit.definition = Unit.new('1000 kWh')
  unit.aliases = %w{MWh megawatt_hour}
end
