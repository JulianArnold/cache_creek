# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'opportunities/new', type: :view do
  before(:each) do
    assign(:opportunity, Opportunity.new(
                           organisation_id: 1,
                           person_id: 1,
                           job_title: 'MyString',
                           job_description: 'MyText',
                           category: 'MyString'
                         ))
  end

  it 'renders new opportunity form' do
    render

    assert_select 'form[action=?][method=?]', opportunities_path, 'post' do
      assert_select 'input#opportunity_organisation_id[name=?]', 'opportunity[organisation_id]'

      assert_select 'input#opportunity_person_id[name=?]', 'opportunity[person_id]'

      assert_select 'input#opportunity_job_title[name=?]', 'opportunity[job_title]'

      assert_select 'textarea#opportunity_job_description[name=?]', 'opportunity[job_description]'

      assert_select 'input#opportunity_category[name=?]', 'opportunity[category]'
    end
  end
end
