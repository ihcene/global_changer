class EmissionCalculation < ApplicationRecord
  has_one_attached :file
  has_many :items, class_name: 'EmissionCalculationItem', dependent: :destroy

  after_create { Job.perform_later(self) }

  def process!
    return if processed_at?

    transaction do
      file.open do |file_stream|
        xlsx = Roo::Spreadsheet.open(file_stream)
        xlsx.sheet(0).each(source: "Emission Source",	quantity: "Quantity", unit: "Unit", factor_name: "Emission Factor Name").with_index do |data, i|
          next if i.zero?

          items.create!(data)
        end

        update!(processed_at: Time.current)
      end
    end
  end

  class Job < ApplicationJob
    queue_as :default

    def perform(request)
      request.process!
    end
  end
end