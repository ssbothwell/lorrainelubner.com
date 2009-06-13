class Cvcat < ActiveRecord::Base
  has_many :cventries, :dependent => :destroy
  accepts_nested_attributes_for :cventries, :allow_destroy => true
end
