require 'spec_helper'
describe "entries" do
  describe "search page" do
    before do
      4.times{ Factory.create(:entry, :first_name => "Marco" )}
      3.times{ Factory.create(:entry)}
      visit "/entries"
    end

    it "should have a search textfield" do
      page.should have_css('#q')
    end

    it "should have a link to 'add new entry'" do
      page.should have_link('add a new entry')
      find_link('add a new entry')[:href].should == "/entries/new" 
    end

    it "should find no records without a search parameter" do
      page.all('.entry_row').should be_empty
    end

    it "should find all entries matching 'Marco'" do
      fill_in 'q', :with => "Marco"
      click_on 'search'
      page.all('.entry_row').length.should be > 3
    end

    it "should display an entry link for each entry" do
      fill_in 'q', :with => "Marco"
      click_on 'search'
      page.all('.entry_row').each{|r|
        r.should have_link("Edit this entry")
        l = find_link('Edit this entry')
        l[:href].should match(/entries\/\d+\/edit/)
      }
    end
  end

  describe "new entry page" do
    it "should create a new entry with proper values" do
      entry_count = Entry.count
      visit '/entries/new'
      fill_in 'entry_first_name', :with => "Antonio"
      fill_in 'entry_last_name', :with => "Rossi"
      fill_in 'entry_phone_number', :with => "+39 987 165423"
      click_on "Create"
      current_path.should == "/entries"
      Entry.count.should == entry_count + 1
    end

    it "should display error messages when wrong values are submitted" do
      pending "TODO"
    end
  end

  describe "edit entry page" do
    it "should allow editing an entry" do
      pending "TODO"
    end
  end
end
