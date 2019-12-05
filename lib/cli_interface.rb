def welcome_message
    puts " "
    puts 'Hello, welcome to the cool kids app'
    puts " "
    login_signup
end 

def login_signup
    puts 'Please enter or create a username'
    user_input = gets.chomp 
    @current_patient = Patient.find_or_create_by(name: user_input)
    @repeat = true
    main_menu
end 

def main_menu
    if @repeat == true
        puts " "
        puts "Welcome to the main menu #{@current_patient.name}! please enter an option number"
        puts " "
        puts "Option 1: See list of doctors"
        puts " "
        puts "Option 2: See list of your appointments"
        puts " "
        puts "Option 3: Set up an appointment"
        puts " "
        puts "Option 4: Change username"
        puts " "
        puts "Option 5: Exit app"
    end
    @repeat = true
    user_input = gets.to_i
    if user_input == 1
        doctors_list
    elsif user_input == 2
        appointments_list
    elsif user_input == 3
        set_up_appointment
    elsif user_input == 4
        change_username
    elsif user_input == 5

    else
        puts "Please enter a valid option number"
        @repeat = false
        main_menu
    end
end 

def change_username 
    if @repeat == true
        puts "Please enter your new username"
        user_input = gets.chomp
        new_username = Patient.find_by(name: @current_patient.name)
        new_username.name = user_input
        new_username.save
        @current_patient.name = user_input
        puts " "
        puts "Please enter an option number"
        puts " "
        puts "Option 1: Change username again"
        puts " "
        puts "Option 2: Return to main menu"
    end
    @repeat = true
    user_input = gets.to_i
    if user_input == 1
        change_username
    elsif user_input == 2
        main_menu
    else
        puts "Please enter a valid option number"
        @repeat = false
        change_username
    end
end

def doctors_list
    if @repeat == true
        Doctor.all.each {|doctor| puts "#{doctor.name}, location: #{doctor.location}, specialty: #{doctor.specialty}"}
        puts " "
        puts "Please enter an option number"
        puts " "
        puts "Option 1: Filter list by location"
        puts " "
        puts "Option 2: Filter list by specialty"
        puts " "
        puts "Option 3: Return to main menu"
    end
    @repeat = true
    user_input = gets.to_i
    if user_input == 1
        doctors_list_filter_location
    elsif user_input == 2
        doctors_list_filter_specialty
    elsif user_input == 3
        main_menu
    else
        puts "Please enter a valid option number"
        @repeat = false
        doctors_list
    end
end

def doctors_list_filter_location
    if @repeat == true
        puts "enter a location"
        user_input = gets.chomp
        Doctor.all.select {|doctor| puts "#{doctor.name}" if doctor.location == user_input}
        puts " "
        puts "Please enter an option number"
        puts " "
        puts "Option 1: Enter a different location"
        puts " "
        puts "Option 2: Return to main menu"
    end
    @repeat = true
    user_input = gets.to_i
    if user_input == 1
        doctors_list_filter_location
    elsif user_input == 2
        main_menu
    else
        puts "Please enter a valid option number"
        @repeat = false
        doctors_list_filter_location
    end
end

def doctors_list_filter_specialty
    if @repeat == true
        puts "enter a specialty"
        user_input = gets.chomp
        Doctor.all.select {|doctor| puts "#{doctor.name}" if doctor.specialty == user_input}
        puts " "
        puts "Please enter an option number"
        puts " "
        puts "Option 1: Enter a different specialty"
        puts " "
        puts "Option 2: Return to main menu"
    end
    @repeat = true
    user_input = gets.to_i
    if user_input == 1
        doctors_list_filter_specialty
    elsif user_input == 2
        main_menu
    else
        puts "Please enter a valid option number"
        @repeat = false
        doctors_list_filter_specialty
    end
end

def appointments_list
    if @repeat == true
        Appointment.all.select {|appoint| puts "appointment id: #{appoint.id}, doctor id:#{appoint.doctor_id}, your name: #{@current_patient.name}, appointment time: #{appoint.time_stamp}" if appoint.patient_id == @current_patient.id}
        puts " "
        puts "Please enter an option number"
        puts " "
        puts "Option 1: Delete an appointment"
        puts " "
        puts "Option 2: Return to main menu"
        puts " "
        puts "Option 3: Create an appointment"
    end
    @repeat = true
    user_input = gets.to_i
    if user_input == 1
        delete_an_appointment
    elsif user_input == 2
        main_menu
    elsif user_input == 3
        set_up_appointment
    else
        puts "Please enter a valid option number"
        @repeat = false
        appointments_list
    end
end

def delete_an_appointment
    if @repeat == true
        puts "select which appointment to delete by its id"
        user_input = gets.to_i
        appoint_deleted = Appointment.find_by(id: user_input)
        appoint_deleted.destroy
        puts " "
        puts "Please enter an option number"
        puts " "
        puts "Option 1: Delete another appointment"
        puts " "
        puts "Option 2: Return to main menu"
        puts " "
        puts "Option 3: Create an appointment"
    end
    @repeat = true
    user_input = gets.to_i
    if user_input == 1
        delete_an_appointment
    elsif user_input == 2
        main_menu
    elsif
        set_up_appointment
    else
        puts "Please enter a valid option number"
        @repeat = false
        delete_an_appointment
    end
end

def set_up_appointment
    if @repeat == true
        puts " "
        puts "Please enter an option number"
        puts " "
        puts "Option 1: Let the system set up your appointment"
        puts " "
        puts "Option 2: Set up your appointment using specifics such as doctor name, specialty, and location"
    end
    @repeat = true
    user_input = gets.to_i
    if user_input == 1
        auto_appoint_setup
    elsif user_input == 2
        appoint_setup_specific
    else
        puts "Please enter a valid option number"
        @repeat = false
        set_up_appointment
    end
end

def auto_appoint_setup
    if @repeat == true
        Appointment.create(doctor_id: Doctor.all.sample.id, patient_id: @current_patient.id, time_stamp: Time.now)
        puts " "
        puts "Please enter an option number"
        puts " "
        puts "Option 1: set up another appointment"
        puts " "
        puts "Option 2: Return to main menu"
    end
    @repeat = true
    user_input = gets.to_i
    if user_input == 1
        set_up_appointment
    elsif user_input == 2
        main_menu
    else
        puts "Please enter a valid option number"
        @repeat = false
        auto_appoint_setup
    end
end

def appoint_setup_specific
    puts " "
    puts "Enter NONE for any option you don't wish to fill in"
    puts " "                                                                    
    puts "Please enter a location"
    user_input_location = gets.chomp
    puts "Please enter a specialty"
    user_input_specialty = gets.chomp
    puts "Please enter a doctor id"
    user_input_doctor_name = gets.chomp

    Appointment.create(doctor)
end