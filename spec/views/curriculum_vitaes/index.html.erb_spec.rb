# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'curriculum_vitaes/index', type: :view do
  before(:each) do
    assign(:curriculum_vitaes, [
             CurriculumVitae.create!(
               name: 'Name',
               description: 'MyText',
               upload: ''
             ),
             CurriculumVitae.create!(
               name: 'Name',
               description: 'MyText',
               upload: ''
             )
           ])
  end

  it 'renders a list of curriculum_vitaes' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: ''.to_s, count: 2
  end
end
