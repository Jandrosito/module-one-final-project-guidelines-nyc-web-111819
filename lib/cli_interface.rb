def welcome_message
    puts 'Hello, welcome to the cool kids app'
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
        puts "Hello #{@current_patient.name}, please enter an option number"
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
        puts Doctor.all
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
    puts "enter a location"

end

def doctors_list_filter_specialty
    puts "enter a specialty"

end

def appointments_list
    if @repeat == true
        Appointment.all.select do |nombre|
            puts nombre.id == @current_patient.id
        end
        puts "Please enter an option number"
    end
    @repeat = true
    user_input = gets.to_i
    if user_input = 1

    elsif

    else
        puts "Please enter a valid option number"
        @repeat = false
        appointments_list
    end
end

def set_up_appointment

end