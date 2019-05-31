RSpec::Matchers.define :redirect_via_turbolinks_to do |expected|
  match do |_actual|
    begin
      assert_response(:success)
      original_status = response.status
      response.status = 302
      assert_redirected_to(expected)
      response.status = original_status
      assert(response.body.starts_with?('Turbolinks.visit'), 'Expected response body to start with "Turbolinks.visit"')
    rescue ActiveSupport::TestCase::Assertion => e
      @failure_message = e.message
      false
    end
  end

  failure_message do |_actual|
    @failure_message
  end
end
