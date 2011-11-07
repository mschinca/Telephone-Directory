class Entry < ActiveRecord::Base
  validates_presence_of :first_name, :last_name
  validates :phone_number, :presence => true, :format => {:with => /\A\+\d+\s\d+\s\d{6,}\z/ }
end
