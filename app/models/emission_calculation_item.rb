

#
# EmissionCalculationItem represents an item used in emission calculations.
#
# Before saving, it computes the emission in grams based on the associated emission factor.
# The computation is done by multiplying the quantity of the item by the emission factor's quantity in grams.
# If the units differ, it converts the quantity to the emission factor's unit before multiplying.
#
class EmissionCalculationItem < ApplicationRecord
  belongs_to :emission_calculation
  belongs_to :emission_factor, optional: true

  before_save :compute

  def factor_name=(name)
    self.emission_factor = EmissionFactor.find_by!(name:)
  rescue ActiveRecord::RecordNotFound
    self.error_message = "Emission factor not found"
  end

  private

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