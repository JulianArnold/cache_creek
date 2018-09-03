# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'people/index', type: :view do
  before(:each) do
    assign(:people, [
             Person.create!(
               first_name: 'First Name',
               last_name: 'Last Name',
               email: 'Email',
               phone: 'Phone',
               organisation_id: 2,
               linkedin_profile_url: 'Linkedin Profile Url',
               source_of_contact: 'Source Of Contact',
               cv_version: 'Cv Version',
               status: 'Status'
             ),
             Person.create!(
               first_name: 'First Name',
               last_name: 'Last Name',
               email: 'Email',
               phone: 'Phone',
               organisation_id: 2,
               linkedin_profile_url: 'Linkedin Profile Url',
               source_of_contact: 'Source Of Contact',
               cv_version: 'Cv Version',
               status: 'Status'
             )
           ])
  end

  it 'renders a list of people' do
    render
    assert_select 'tr>td', text: 'First Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Last Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Email'.to_s, count: 2
    assert_select 'tr>td', text: 'Phone'.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: 'Linkedin Profile Url'.to_s, count: 2
    assert_select 'tr>td', text: 'Source Of Contact'.to_s, count: 2
    assert_select 'tr>td', text: 'Cv Version'.to_s, count: 2
    assert_select 'tr>td', text: 'Status'.to_s, count: 2
  end
end
