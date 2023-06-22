require_relative 'app'

def main
  app = App.new

  loop do
    puts 'Options:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a person'
    puts '0. Exit'

    print 'Enter your choice: '
    choice = gets.chomp.to_i

    case choice
    when 1
      app.list_all_books
    when 2
      app.list_all_people
    when 3
      print "Enter the person's name: "
      name = gets.chomp
      print "Enter the person's type (teacher or student): "
      type = gets.chomp
      app.create_person(name, type)
    when 4
      print "Enter the book's title: "
      title = gets.chomp
      print "Enter the book's author: "
      author = gets.chomp
      app.create_book(title, author)
    when 5
      print "Enter the person's ID: "
      person_id = gets.chomp.to_i
      print "Enter the book's ID: "
      book_id = gets.chomp.to_i
      print 'Enter the rental date (YYYY-MM-DD): '
      rental_date = gets.chomp
      app.create_rental(person_id, book_id, rental_date)
    when 6
      print "Enter the person's ID: "
      person_id = gets.chomp.to_i
      app.list_rentals_for_person(person_id)
    when 0
      break
    else
      puts 'Invalid choice! Please try again.'
    end

    puts "\n"
  end
end

main
