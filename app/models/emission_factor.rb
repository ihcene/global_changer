class EmissionFactor < ApplicationRecord
  def quantity_in_grames
    weight_unit, factor_unit = unit.split('/', 2)
    Unit.new("#{quantity.to_s} #{weight_unit}").convert_to('g').scalar
  rescue ArgumentError => e
    raise unless ['not compatible with', 'Unit not recognized'].any? { |msg| e.message.include?(msg) }
  end
end