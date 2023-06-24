require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'

# rubocop:disable all

def list_all_books
  @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
end

def list_all_people
  @people.each do |individual|
    profession = if individual.is_a?(Student)
                   'student'
                 else
                   'teacher'
                 end
    puts "[#{profession}] Name: #{individual.name}, Id: #{individual.id}, Age: #{individual.age}"
  end
end

def list_people_with_index
  @people.each_with_index do |individual, index|
    profession = if individual.is_a?(Student)
                   'student'
                 else
                   'teacher'
                 end
    puts "#{index}) [#{profession}] Name: #{individual.name}, Id: #{individual.id}, Age: #{individual.age}"
  end
end

def create_person
  print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
  student_teacher_choice = gets.to_i
  if student_teacher_choice == 1
    print 'Age: '
    age = gets.to_i
    print 'Name: '
    name = gets.to_s
    print 'Parent permission? [y/n]'
    parent_permission = gets.to_s
    student = Student.new(age, name, 'A', parent_permission: parent_permission)
    puts "Student-name: #{student.name}"
    @people << student
    puts 'Person created successfully!'
  elsif student_teacher_choice == 2
    print 'Age: '
    age = gets.to_i
    print 'Name: '
    name = gets.to_s
    print 'Specialization: '
    specialization = gets.to_s
    teacher = Teacher.new(age, name, specialization: specialization)
    @people << teacher
    puts 'Person created successfully!'
  else
    puts 'Wrong input!'
    create_person
  end
end

def create_book
  print 'Title: '
  title = gets.to_s
  print 'Author: '
  author = gets.to_s
  book = Book.new(title, author)
  @books << book
  puts 'Book created successfully!'
end

def select_person_by_index(_index)
  @people.map { |person| }
end

def create_rental
  puts 'Select a book from the following list by number: '
  @books.each_with_index { |book, index| puts "#{index}) Title:  \"#{book.title}\", Author: #{book.author}" }
  print 'Book index: '
  choice = gets.to_i
  selected_book = @books[choice]
  puts 'Select a person from the following list by number (not id):'
  list_people_with_index
  person_index = gets.to_i
  person = @people[person_index]
  print 'Date: '
  chosen_date = gets
  Rental.new(selected_book, chosen_date, person)
  puts 'Rental created successfully!'
end

def list_rentals_for_person
  # filter person by id
  print 'Enter persons id: '
  person_id = gets.to_i
  find_person_by_id(person_id)

  # filter rentals by person
  puts 'Rentals: '
  puts(@rentals.map { |rent| rent })
end

private

def find_person_by_id(person_id)
  @people.find { |person| person.id == person_id }
end

def find_book_by_id(book_id)
  @books.find { |book| book.id == book_id }
end

def find_rentals_for_person(_person)
  @rentals = @rentals.select { |rental| rental.person.id == person_id }
end
# rubocop:enable all