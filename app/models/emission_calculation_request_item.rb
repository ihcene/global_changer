class EmissionCalculationRequestItem < ApplicationRecord
  belongs_to :emission_calculation_request
  belongs_to :emission_factor, optional: true

  def compute
    self.computed_emission_in_grams =
      if unit == emission_factor.factor_unit
        emission_factor.quantity_in_grames * quantity
      else
        emission_factor.quantity_in_grames * Unit.new("#{quantity.to_s} #{unit}").convert_to(emission_factor.factor_unit).scalar
      end
  rescue ArgumentError => e
    if ['not compatible with', 'Unit not recognized'].any? { |msg| e.message.include?(msg) }
      self.error_message = "Unit conversion error: #{e.message}"
    else
      raise
    end
  end
end