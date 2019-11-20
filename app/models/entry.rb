class Entry < ApplicationRecord
 scope :least_entries , ->(base_date){
   where("reserved_date >=? and reserved_date <=? ",
     base_date.to_date - 7.days,base_date.to_date + 7.days)
   }

 belongs_to :room
 belongs_to :user

end
