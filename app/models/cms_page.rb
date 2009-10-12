class CmsPage < ActiveRecord::Base
  acts_as_list :scope => :parent_id
  
  validates_presence_of :title
  validates_presence_of :reference_string
  
  default_scope :order => :reference_string
  
  def self.get(reference_string)
    find_by_reference_string(reference_string) || self.new(:title => reference_string, :sub_title => "CMS Page Missing  - #{reference_string}", :path => '')
  end
  
  def is_current?(uri)
    self.path.blank? ? false : uri.match(self.path) || uri.match((self.parent.path rescue "-"))
  end
  
end
