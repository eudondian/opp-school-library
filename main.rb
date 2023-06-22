require './app'

def main
  # rubocop:disable Metrics/MethodLength,Metrics/CyclomaticComplexity
  app = App.new

  loop do
    print_menu_options
    choice = gets.chomp.to_i

    case choice
    when 1
      list_all_books(app)
    when 2
      list_all_people(app)
    when 3
      create_person(app)
    when 4
      create_book(app)
    when 5
      create_rental(app)
    when 6
      list_rentals_for_person(app)
    when 7
      puts 'Quitting the app...'
      break
    else
      puts 'Invalid choice'
    end

    puts
  end
end

def print_menu_options
  puts 'Please choose an option:'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List rentals for a person'
  puts '7. Quit'
end

def list_all_books(app)
  app.list_all_books
end

def list_all_people(app)
  app.list_all_people
end

def create_person(app)
  puts 'Enter name:'
  name = gets.chomp
  puts 'Enter person type (teacher/student):'
  type = gets.chomp
  app.create_person(name, type)
end

def create_book(app)
  puts 'Enter book title:'
  title = gets.chomp
  puts 'Enter book author:'
  author = gets.chomp
  app.create_book(title, author)
end

def create_rental(app)
  puts 'Enter person ID:'
  person_id = gets.chomp.to_i
  puts 'Enter book ID:'
  book_id = gets.chomp.to_i
  puts 'Enter rental date:'
  rental_date = gets.chomp
  app.create_rental(person_id, book_id, rental_date)
end

def list_rentals_for_person(app)
  puts 'Enter person ID:'
  person_id = gets.chomp.to_i
  app.list_rentals_for_person(person_id)
end

main
