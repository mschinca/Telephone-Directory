require 'spec_helper'

describe Entry do
  describe "entry validation:" do
    before do
      @entry = Entry.new
    end
    it "should be valid with valid attributes" do
      @entry.attributes=({:first_name => "Marco",
        :last_name =>"Schincaglia", :phone_number => "+3 1 1232341"})
      @entry.should be_valid
    end
    it "should have a first name" do
      @entry.should_not be_valid
      @entry.errors.full_messages.should include("First name can't be blank")
    end
    it "should have a last name" do
      @entry.should_not be_valid
      @entry.errors.full_messages.should include("Last name can't be blank")
    end
    it "should have a phone number" do
      @entry.should_not be_valid
      @entry.errors.full_messages.should include("Phone number can't be blank")
    end
    describe "phone number:" do
      invalid_numbers=["3 1 123456","+ 3 2 123456","+3 123456","+3 1 12345","+3  1 123456","+3 1  123456","+3 1 123456x"]
      invalid_numbers.each do |num|
        it "#{num} should not be a valid number" do
          @entry.phone_number = num
          @entry.should_not be_valid
          @entry.errors.full_messages.should include("Phone number is invalid")
        end
      end
    end
  end
end
