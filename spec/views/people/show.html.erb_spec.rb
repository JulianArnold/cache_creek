require 'rails_helper'

RSpec.describe "people/show", type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :email => "Email",
      :phone => "Phone",
      :organisation_id => 2,
      :linkedin_profile_url => "Linkedin Profile Url",
      :source_of_contact => "Source Of Contact",
      :cv_version => "Cv Version",
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Linkedin Profile Url/)
    expect(rendered).to match(/Source Of Contact/)
    expect(rendered).to match(/Cv Version/)
    expect(rendered).to match(/Status/)
  end
end
