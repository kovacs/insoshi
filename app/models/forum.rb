# == Schema Information
# Schema version: 30
#
# Table name: forums
#
#  id           :integer         not null, primary key
#  name         :string(255)     
#  description  :text            
#  topics_count :integer         default(0), not null
#  created_at   :datetime        
#  updated_at   :datetime        
#

class Forum < ActiveRecord::Base
  attr_accessible :name, :description

  has_many :topics, :order => "created_at DESC", :dependent => :destroy
  has_many :posts, :through => :topics

  
  validates_length_of :name, :maximum => 255, :allow_nil => true
  validates_length_of :description, :maximum => 1000, :allow_nil => true
end
