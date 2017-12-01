require 'rails_helper'

RSpec.describe "vent_logs/edit", type: :view do
  before(:each) do
    @vent_log = assign(:vent_log, VentLog.create!(
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

  it "renders the edit vent_log form" do
    render

    assert_select "form[action=?][method=?]", vent_log_path(@vent_log), "post" do

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
