require 'rails_helper'

RSpec.describe "vent_logs/new", type: :view do
  before(:each) do
    assign(:vent_log, VentLog.new(
      :organization => "MyString",
      :contact => "MyString",
      :notes => "MyString",
      :phone => 1,
      :email => "MyString",
      :source => "MyString",
      :cv_sent => "MyString",
      :interest => "MyString",
      :cv_version => "MyString"
    ))
  end

  it "renders new vent_log form" do
    render

    assert_select "form[action=?][method=?]", vent_logs_path, "post" do

      assert_select "input#vent_log_organization[name=?]", "vent_log[organization]"

      assert_select "input#vent_log_contact[name=?]", "vent_log[contact]"

      assert_select "input#vent_log_notes[name=?]", "vent_log[notes]"

      assert_select "input#vent_log_phone[name=?]", "vent_log[phone]"

      assert_select "input#vent_log_email[name=?]", "vent_log[email]"

      assert_select "input#vent_log_source[name=?]", "vent_log[source]"

      assert_select "input#vent_log_cv_sent[name=?]", "vent_log[cv_sent]"

      assert_select "input#vent_log_interest[name=?]", "vent_log[interest]"

      assert_select "input#vent_log_cv_version[name=?]", "vent_log[cv_version]"
    end
  end
end
