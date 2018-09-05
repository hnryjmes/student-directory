def interactive_menu
students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we'll be adding more items
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      if students.size == 0
        puts "ERROR: no students, please add a student"
        next
      end
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end
end


def input_students
  puts "Please enter the names, ages and cohorts of the students like this: name, age, cohort. To default to november cohort, you can leave it blank."
  puts "To finish, just hit return twice"
  # for pre-populated data just uncomment lines below, otherwise assume start with empty array
  students = [
    # {name: "Dr. Hannibal Lecter", age: 50, cohort: :november},
    # {name: "Darth Vader", age: 38, cohort: :november},
    # {name: "Nurse Ratched", age: 75, cohort: :september
    # },
  ]
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
    students << {name:
    name, age: age, cohort: cohort }
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
  # get students by cohort
  sorted = {}
  students.each do |student|
    if sorted[student[:cohort]] == nil
      sorted[student[:cohort]] = [].push(student)
    else
      sorted[student[:cohort]].push(student)
    end
  end
  sorted.each do |cohort, sorted_students|
    puts "#{cohort} cohort: "
    puts " "
    sorted_students.each do |student|
      puts "* #{student[:name]}, #{student[:age]}"
    end
    puts "-------------"
  end

  students.each_with_index do |student, index|
    # puts "#{index + 1}. #{student[:name]}, age #{student[:age]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  string = "Overall, we have #{students.count} great student"

  if students.count != 1
    string += "s"
  end

  puts string
end

interactive_menu
