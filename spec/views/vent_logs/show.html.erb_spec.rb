require 'rails_helper'

RSpec.describe "vent_logs/show", type: :view do
  before(:each) do
    @vent_log = assign(:vent_log, VentLog.create!(
      :organization => "Organization",
      :contact => "Contact",
      :notes => "Notes",
      :phone => 2,
      :email => "Email",
      :source => "Source",
      :cv_sent => "Cv Sent",
      :interest => "Interest",
      :cv_version => "Cv Version"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Organization/)
    expect(rendered).to match(/Contact/)
    expect(rendered).to match(/Notes/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Source/)
    expect(rendered).to match(/Cv Sent/)
    expect(rendered).to match(/Interest/)
    expect(rendered).to match(/Cv Version/)
  end
end
