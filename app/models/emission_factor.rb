class EmissionFactor < ApplicationRecord
  def quantity_in_grames
    weight_unit, factor_unit = unit.split('/', 2)
    Unit.new("#{quantity.to_s} #{weight_unit}").convert_to('g').scalar
  end

  def factor_unit
    _, factor_unit = unit.split('/', 2)

    factor_unit
  end
end