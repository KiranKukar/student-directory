require 'date'

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

def input_students
    puts "Please enter the names of the students and the cohort seperated by a ','"
    puts "To finish, just hit return twice"
    students = []
    input = gets.chop
    while !input.empty? do
        individual = input.split(",")
        if individual.length < 2
            individual.push("November")
        end
        if !Date::MONTHNAMES.include? individual[1]
            puts "you have a typo, please re-enter"
            input = gets.chop
        end
        students << {name: individual[0], cohort: individual[1].to_sym}
        puts "Now we have #{students.count} students"
        input = gets.chop
    end
    students
end

# methods to print the header, the list of students on seperate lines and the student count
def print_header
    puts "The students of Villains Academy".center(60)
    puts "-----------".center(60,"-")
end

def print_list(students)
    if !students.empty?
        print_header
        index = 0
        while index < students.length
            current_name = students[index]
            puts "#{index + 1}. #{current_name[:name]} (#{current_name[:cohort]} cohort)".center(60)
            index += 1
        print_footer(students)
        end
        puts "no students entered"
    end
end

def print_footer(students)
    if students.count == 1
        print "Overall, we have 1 great student".center(60)
    else
        print "Overall, we have #{students.count} great students".center(60) 
    end
end

# Call the methods so the programme actually runs
students = input_students
print_list(students)