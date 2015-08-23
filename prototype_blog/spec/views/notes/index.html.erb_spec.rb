require 'spec_helper'

describe "notes/index" do
  before(:each) do
    assign(:notes, [
      stub_model(Note,
        :title => "Title",
        :introduction => "Introduction",
        :note_image => "Note Image"
      ),
      stub_model(Note,
        :title => "Title",
        :introduction => "Introduction",
        :note_image => "Note Image"
      )
    ])
  end

  it "renders a list of notes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Introduction".to_s, :count => 2
    assert_select "tr>td", :text => "Note Image".to_s, :count => 2
  end
end
