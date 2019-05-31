RSpec::Matchers.define :have_attrs do |attrs|
  match do |actual|
    @matcher = have_attributes(attrs)
    @matcher.matches?(actual)
  end

  chain :with_nested do |*keys|
    new_attrs = attrs.except(*(keys.map { |key| :"#{key}_attributes" }))
    keys.each do |key|
      new_attrs[key] = have_attributes(attrs[:"#{key}_attributes"])
    end
    attrs = new_attrs
  end

  failure_message do |_actual|
    @matcher.failure_message
  end
end
