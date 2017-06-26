class Encounter < ApplicationRecord
  belongs_to :patient
  validates :visit_number, presence: true, 
                   length: { minimum: 1 }
  validates :admitted_at, presence: true 
end
