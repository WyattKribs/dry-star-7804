require 'rails_helper'

RSpec.describe 'doctor showpage' do
  before (:each) do
    @hospital = Hospital.create!(name: 'Saint Someones')
    @doctor1 = Doctor.create!(hospital_id: @hospital.id, name: 'Gunther Guyman', specialty: 'pediatrics', university: 'U of C')
    @patient1 = Patient.create(name: 'Barry Gilmore', age: 29)
    @patient2 = Patient.create(name: 'Hedric Page', age: 43)
    @pd1 = PatientDoctor.create!(patient_id: @patient1.id, doctor_id: @doctor1.id)
    @pd2 = PatientDoctor.create!(patient_id: @patient2.id, doctor_id: @doctor1.id)


    visit "/doctors/#{@doctor1.id}"
  end

  it "has the doctor's information" do
    expect(page).to have_content(@doctor1.name)
    expect(page).to have_content(@doctor1.specialty)
    expect(page).to have_content(@doctor1.university)
  end

  it "has the name of the hospital the doctor works at" do
    expect(page).to have_content(@hospital.name)
  end

  it "lists the doctor's patients" do
    expect(page).to have_content(@patient1.name)
    expect(page).to have_content(@patient2.name)
  end
end
