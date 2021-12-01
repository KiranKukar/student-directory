students = ["Dr. Hannibal Lecter",
    "Darth Vader", "Nurse Ratched", "Michael Corleone", "Alex DeLarge",
    "The Wicked Witch of the West", "Terminator", "Freddy Krueger",
    "The Joker", "Joffrey Baratheon", "Norman Bates"]
# methods to print the header, the list of students on seperate lines and the student count
def print_header
    puts "The students of Villains Academy"
    puts "-----------"
end

def print_list(names)
    puts names[0..-1]
    puts "yes"
end 

def print_footer(names)
    print "Overall, we have #{names.count} great students"
end

# Call the methods so the programme actually runs

print_header
print_list(students)
print_footer(students)