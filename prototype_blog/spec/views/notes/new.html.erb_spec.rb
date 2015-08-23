require 'spec_helper'

describe "notes/new" do
  before(:each) do
    assign(:note, stub_model(Note,
      :title => "MyString",
      :introduction => "MyString",
      :note_image => "MyString"
    ).as_new_record)
  end

  it "renders new note form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", notes_path, "post" do
      assert_select "input#note_title[name=?]", "note[title]"
      assert_select "input#note_introduction[name=?]", "note[introduction]"
      assert_select "input#note_note_image[name=?]", "note[note_image]"
    end
  end
end
