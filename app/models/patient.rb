class Patient < ApplicationRecord
  has_many :patient_doctors, dependent: :delete_all
  has_many :doctors, through: :patient_doctors
end
