RSpec::Matchers.define :have_header_cells do |cell_values|
  match do |worksheet|
    worksheet.rows[0].cells.map(&:value) == cell_values
  end

  failure_message do |actual|
    "Expected #{actual.rows[0].cells.map(&:value)} to be #{expected}"
  end
end

RSpec::Matchers.define :have_cells do |expected|
  match do |worksheet|
    worksheet.rows[@index].cells.map(&:value) == expected
  end

  chain :in_row do |index|
    @index = index
  end

  failure_message do |actual|
    "Expected #{actual.rows[@index].cells.map(&:value)} to include #{expected} at row #{@index}."
  end
end
