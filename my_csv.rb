require 'csv'

module MyCsv
  def read(filename)
    CSV.new(filename).read
  end
end
