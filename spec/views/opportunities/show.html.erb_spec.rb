require 'rails_helper'

RSpec.describe "opportunities/show", type: :view do
  before(:each) do
    @opportunity = assign(:opportunity, Opportunity.create!(
      :organisation_id => 2,
      :person_id => 3,
      :job_title => "Job Title",
      :job_description => "MyText",
      :category => "Category"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Job Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Category/)
  end
end
