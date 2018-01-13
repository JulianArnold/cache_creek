require 'rails_helper'

RSpec.describe "organisations/show", type: :view do
  before(:each) do
    @organisation = assign(:organisation, Organisation.create!(
      :name => "Name",
      :postal_address => "MyText",
      :phone => "Phone"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Phone/)
  end
end
