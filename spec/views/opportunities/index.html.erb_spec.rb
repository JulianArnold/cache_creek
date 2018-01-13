require 'rails_helper'

RSpec.describe "opportunities/index", type: :view do
  before(:each) do
    assign(:opportunities, [
      Opportunity.create!(
        :organisation_id => 2,
        :person_id => 3,
        :job_title => "Job Title",
        :job_description => "MyText",
        :category => "Category"
      ),
      Opportunity.create!(
        :organisation_id => 2,
        :person_id => 3,
        :job_title => "Job Title",
        :job_description => "MyText",
        :category => "Category"
      )
    ])
  end

  it "renders a list of opportunities" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Job Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
  end
end
