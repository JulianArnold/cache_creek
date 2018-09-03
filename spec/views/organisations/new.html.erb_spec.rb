# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'organisations/new', type: :view do
  before(:each) do
    assign(:organisation, Organisation.new(
                            name: 'MyString',
                            postal_address: 'MyText',
                            phone: 'MyString'
                          ))
  end

  it 'renders new organisation form' do
    render

    assert_select 'form[action=?][method=?]', organisations_path, 'post' do
      assert_select 'input#organisation_name[name=?]', 'organisation[name]'

      assert_select 'textarea#organisation_postal_address[name=?]', 'organisation[postal_address]'

      assert_select 'input#organisation_phone[name=?]', 'organisation[phone]'
    end
  end
end
