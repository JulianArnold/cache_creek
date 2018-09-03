# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'curriculum_vitaes/new', type: :view do
  before(:each) do
    assign(:curriculum_vitae, CurriculumVitae.new(
                                name: 'MyString',
                                description: 'MyText',
                                upload: ''
                              ))
  end

  it 'renders new curriculum_vitae form' do
    render

    assert_select 'form[action=?][method=?]', curriculum_vitaes_path, 'post' do
      assert_select 'input#curriculum_vitae_name[name=?]', 'curriculum_vitae[name]'

      assert_select 'textarea#curriculum_vitae_description[name=?]', 'curriculum_vitae[description]'

      assert_select 'input#curriculum_vitae_upload[name=?]', 'curriculum_vitae[upload]'
    end
  end
end
