=begin
students = [
    {name: "Dr. Hannibal Lecter", cohort: :november},
    {name: "Darth Vader", cohort: :november},
    {name: "Nurse Ratched", cohort: :november},
    {name: "Michael Corleone", cohort: :november},
    {name: "Alex DeLarge", cohort: :november},
    {name: "The Wicked Witch of the West", cohort: :november},
    {name: "Terminator", cohort: :november},
    {name:"Freddy Krueger", cohort: :november},
    {name: "The Joker", cohort: :november},
    {name: "Joffrey Baratheon", cohort: :november},
    {name: "Norman Bates", cohort: :november}
]
=end
require 'csv'
@students = []

def try_load_students
    filename = ARGV.first # first arguemnt from the command line
    if filename.nil? # if no argument is given load students.csv
        load_students("students.csv")
    elsif File.exists?(filename) # if the argument exists as a file
        load_students(filename)
    else # if it doesn't exist
        puts "Sorry #{filename} doesn't exist"
        exit # quit the program
    end
end 

def load_students(filename)
    CSV.foreach(filename) do |line|
        name, cohort = line
        add_student(name, cohort)
    end
    puts "Loaded #{@students.count} students from #{filename}"
end

def interactive_menu
    loop do
        print_menu
        process(STDIN.gets.chomp)
    end
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the student"
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv"
    puts "9. Exit"
end

def process(selection)
    case selection
    when "1"
        input_students
    when "2"
        show_students
    when "3"
        filename = select_filename
        save_students(filename)
    when "4"
        filename = select_filename
        load_students(filename)
    when "9"
        exit
    else
        puts "I don't know what you meant, try again"
    end
end

def select_filename
    puts "Please input which file you want to load from or save to"
    filename = STDIN.gets.chomp
end
def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    name = STDIN.gets.chomp
    while !name.empty? do
        add_student(name, :november)
        puts "#{name} added to our #{:november} cohort, now we have #{@students.count} students"
        name = STDIN.gets.chomp
    end
end

def save_students(filename)
    CSV.open(filename, "wb") do |file|
        @students.each do |student|
            file << [student[:name], student[:cohort]]
        end
    end
    puts "List of students saved to #{filename}"
end

def add_student(name, cohort)
    @students << {name: name, cohort: cohort.to_sym}
end

# methods to print the header, the list of students on seperate lines and the student count
def show_students
    print_header
    print_student_list
    print_footer
end

def print_header
    puts "The students of Villains Academy"
    puts "-----------"
end

def print_student_list
    @students.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def print_footer
    puts "Overall, we have #{@students.count} great students"
end

# Try to load student names if an argument was passed at openening
try_load_students
# Call the interactive menu method so the programme runs
interactive_menu