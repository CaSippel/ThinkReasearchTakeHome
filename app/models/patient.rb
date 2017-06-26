class Patient < ApplicationRecord
   has_many :encounters
   validates :mrn, presence: true, 
                   length: { minimum: 1 }
   validates :first_name, presence: true, 
                   length: { minimum: 1 }
   validates :middle_name, presence: true, 
                   length: { minimum: 1 }
end
