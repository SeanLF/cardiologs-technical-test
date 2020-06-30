require 'csv'
require './models/measurement.rb'

module ReadMeasurementsHelper
  def read_measurements(filename)
    CSV.new(filename).map { |row| Measurement.new(row) }
  end
end
