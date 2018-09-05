def input_students
  puts "Please enter the names, ages and cohorts of the students like this: name, age, cohort. To default to november cohort, you can leave it blank."
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  input = gets.chomp
  # while the name is not empty, repeat this code
  while !input.empty? do
    arr = input.split(", ")
    puts arr[2]
    if arr[2] == nil
      arr.push("november")
    end
    name, age, cohort = arr[0], arr[1], arr[2].to_s
    # add the student hash to the array
    students << {name: name, age: age, cohort: cohort }
    puts "Now we have #{students.count} students"
    # get another name from the user
    input = gets.chomp
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
