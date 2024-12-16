class EmissionCalculationRequestItem < ApplicationRecord
  belongs_to :emission_calculation_request
  belongs_to :emission_factor, optional: true
end