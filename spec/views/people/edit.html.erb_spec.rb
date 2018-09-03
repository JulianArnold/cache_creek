# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'people/edit', type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(
                                first_name: 'MyString',
                                last_name: 'MyString',
                                email: 'MyString',
                                phone: 'MyString',
                                organisation_id: 1,
                                linkedin_profile_url: 'MyString',
                                source_of_contact: 'MyString',
                                cv_version: 'MyString',
                                status: 'MyString'
                              ))
  end

  it 'renders the edit person form' do
    render

    assert_select 'form[action=?][method=?]', person_path(@person), 'post' do
      assert_select 'input#person_first_name[name=?]', 'person[first_name]'

      assert_select 'input#person_last_name[name=?]', 'person[last_name]'

      assert_select 'input#person_email[name=?]', 'person[email]'

      assert_select 'input#person_phone[name=?]', 'person[phone]'

      assert_select 'input#person_organisation_id[name=?]', 'person[organisation_id]'

      assert_select 'input#person_linkedin_profile_url[name=?]', 'person[linkedin_profile_url]'

      assert_select 'input#person_source_of_contact[name=?]', 'person[source_of_contact]'

      assert_select 'input#person_cv_version[name=?]', 'person[cv_version]'

      assert_select 'input#person_status[name=?]', 'person[status]'
    end
  end
end
