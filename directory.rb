def input_students
  puts "Please enter the names and ages of the students like this: name, age"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name_and_age = gets.chomp
  # while the name is not empty, repeat this code
  while !name_and_age.empty? do
    arr = name_and_age.split(", ")
    name, age = arr[0], arr[1]
    # add the student hash to the array
    students << {name: name, age: age, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name_and_age = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]}, age #{student[:age]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "-------------"
  string = "Overall, we have #{students.count} great students"
  puts string
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
