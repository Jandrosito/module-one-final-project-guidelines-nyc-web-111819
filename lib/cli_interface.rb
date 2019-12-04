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
        puts "Option 4: Exit app"
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

    else
        puts "Please enter a valid option number"
        @repeat = false
        main_menu
    end
end 

def doctors_list
    if @repeat == true
        puts Doctor.all.name
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
        Doctor.all.select {|locate|  locate.location == user_input}
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
        Doctor.all.select {|doctor| doctor.specialty == user_input}
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
        Appointment.all.select {|nombre| nombre.patient_id == @current_patient.id}
        puts " "
        puts "Please enter an option number"
        puts "Option 1: "
        puts " "
        puts "Option 2: "
    end
    @repeat = true
    user_input = gets.to_i
    if user_input == 1

    elsif user_input == 2

    else
        puts "Please enter a valid option number"
        @repeat = false
        appointments_list
    end
end

def set_up_appointment

end