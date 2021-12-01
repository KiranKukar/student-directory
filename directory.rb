students = ["Dr. Hannibal Lecter",
    "Darth Vader", "Nurse Ratched", "Michael Corleone", "Alex DeLarge",
    "The Wicked Witch of the West", "Terminator", "Freddy Krueger",
    "The Joker", "Joffrey Baratheon", "Norman Bates"]
# first we print the header and the list of students on seperate lines
puts "The students of Villains Academyy"
puts "-----------"
puts students[0..-1]
# Then we print the count of students on one line
print "Overall, we have #{students.count} great students"