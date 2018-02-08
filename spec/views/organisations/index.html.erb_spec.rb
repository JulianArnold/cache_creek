require 'rails_helper'

RSpec.describe 'organisations/index', type: :view do
  before(:each) do
    assign(:organisations, [
             Organisation.create!(
               name: 'Name',
               postal_address: 'MyText',
               phone: 'Phone'
             ),
             Organisation.create!(
               name: 'Name',
               postal_address: 'MyText',
               phone: 'Phone'
             )
           ])
  end

  it 'renders a list of organisations' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: 'Phone'.to_s, count: 2
  end
end
