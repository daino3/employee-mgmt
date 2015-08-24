module GonHelpers
  def should_set_gon(response_body, gon_variable)
    gon_data = response.body.match(/(gon.#{gon_variable.to_s}=)(.+)/)
    expect(gon_data).to be_present
    expect(gon_data[2]).to be_present
  end
end
