# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'curriculum_vitaes/show', type: :view do
  before(:each) do
    @curriculum_vitae = assign(:curriculum_vitae, CurriculumVitae.create!(
                                                    name: 'Name',
                                                    description: 'MyText',
                                                    upload: ''
                                                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
