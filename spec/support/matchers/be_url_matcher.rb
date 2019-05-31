RSpec::Matchers.define :be_url do |_expected|
  match do |actual|
    begin
      URI.parse(actual)
    rescue
      false
    end
  end
end
