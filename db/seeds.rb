# Patient.new(name: "Edward")
# Patient.create(name: "Edward")

Patient.destroy_all
Doctor.destroy_all
Appointment.destroy_all

10.times do 
    Patient.create(name: Faker::FunnyName.name) 
end 

10.times do
    Doctor.create(name: Faker::FunnyName.name, location: Faker::Address.city)
end

20.times do 
    Appointment.create(patient_id: Patient.all.sample.id, doctor_id: Doctor.all.sample.id, time_stamp: DateTime.now)
end 