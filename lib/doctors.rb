class Doctor < ActiveRecord::Base
    has_many :appointment
    has_many :patient, through: :appointment
end