require 'csv'

@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to file"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit # this will cause the program to terminate
  when "3"
    save_students
  when "4"
    load_students
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    add_student_to_array(name)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def add_student_to_array(name, cohort = "november")
  @students << {name: name, cohort: cohort.to_sym}
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "-------------"
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  puts "Enter filename to save to"
  filename = STDIN.gets.chomp
  # open the file for writing
  CSV.open(filename, "w") do |csv|
    @students.each do |student|
      csv << [student[:name], student[:cohort]]
    end
  end
  puts "Saved file"
end

def load_students(filename = "students.csv")
  if File.exist?(filename)
    CSV.foreach(filename) do |row|
      add_student_to_array(row[0], row[1])
    end
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    return # return if doesn't exist
  end
end

def try_load_students
  load_students # try default first
  filename = ARGV.first# first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  load_students(filename)
end

try_load_students
interactive_menu
