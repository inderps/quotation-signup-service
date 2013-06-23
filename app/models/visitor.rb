class Visitor < ActiveRecord::Base
  attr_accessible :email, :identifier, :visit_count, :visit_time
end
