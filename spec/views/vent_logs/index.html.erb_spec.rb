require 'rails_helper'

RSpec.describe "vent_logs/index", type: :view do
  before(:each) do
    assign(:vent_logs, [
      VentLog.create!(
        :organization => "Organization",
        :contact => "Contact",
        :notes => "Notes",
        :phone => 2,
        :email => "Email",
        :source => "Source",
        :cv_sent => "Cv Sent",
        :interest => "Interest",
        :cv_version => "Cv Version"
      ),
      VentLog.create!(
        :organization => "Organization",
        :contact => "Contact",
        :notes => "Notes",
        :phone => 2,
        :email => "Email",
        :source => "Source",
        :cv_sent => "Cv Sent",
        :interest => "Interest",
        :cv_version => "Cv Version"
      )
    ])
  end

  it "renders a list of vent_logs" do
    render
    assert_select "tr>td", :text => "Organization".to_s, :count => 2
    assert_select "tr>td", :text => "Contact".to_s, :count => 2
    assert_select "tr>td", :text => "Notes".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Source".to_s, :count => 2
    assert_select "tr>td", :text => "Cv Sent".to_s, :count => 2
    assert_select "tr>td", :text => "Interest".to_s, :count => 2
    assert_select "tr>td", :text => "Cv Version".to_s, :count => 2
  end
end
