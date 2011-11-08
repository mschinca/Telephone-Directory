class Entry < ActiveRecord::Base
  validates_presence_of :first_name, :last_name
  validates :phone_number, :presence => true, :format => {:with => /\A\+\d+\s\d+\s\d{6,}\z/ }
  #TODO: consider using a full text search engine like Solr or Sphinx
  scope :search, lambda {|arg|
    t = arel_table
    where(
      t[:first_name].matches("%#{arg}%").
      or(t[:last_name].matches("%#{arg}%")).
      or(t[:phone_number].matches("%#{arg}%"))
    )
  }
end
