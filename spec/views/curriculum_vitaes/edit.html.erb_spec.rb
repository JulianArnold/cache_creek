require 'rails_helper'

RSpec.describe "curriculum_vitaes/edit", type: :view do
  before(:each) do
    @curriculum_vitae = assign(:curriculum_vitae, CurriculumVitae.create!(
      :name => "MyString",
      :description => "MyText",
      :upload => ""
    ))
  end

  it "renders the edit curriculum_vitae form" do
    render

    assert_select "form[action=?][method=?]", curriculum_vitae_path(@curriculum_vitae), "post" do

      assert_select "input#curriculum_vitae_name[name=?]", "curriculum_vitae[name]"

      assert_select "textarea#curriculum_vitae_description[name=?]", "curriculum_vitae[description]"

      assert_select "input#curriculum_vitae_upload[name=?]", "curriculum_vitae[upload]"
    end
  end
end
