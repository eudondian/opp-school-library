require './person'
require './student'
require './teacher'
require './book'
require './rental'


class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_all_books
    puts 'All books'
    @books.each { |book| puts book }
  end

  def list_all_people
    puts 'All people'
    @people.each { |person| puts person }
  end

  def create_person(name, type)
    if type == 'teacher'
      person = Teacher.new(name)
    elsif type == 'student'
      person = Student.new(name)
    else
      puts 'Invalid person type'
      return
    end

    @people << person
    puts "#{person} created successfully!"
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
    puts "#{book} created successfully!"
  end

  def create_rental(person_id, book_id, rental_date)
    person = find_person_by_id(person_id)
    book = find_book_by_id(book_id)

    if person.nil? || book.nil?
      puts 'Person or book not found'
      return
    end

    rental = Rental.new(person, book, rental_date)
    @rentals << rental
    puts "#{rental} created successfully!"
  end

  def list_rentals(person_id)
    person = find_person_by_id(person_id)

    if person.nil?
      puts 'Person not found'
      return
    end

    rentals = find_rentals_for_person(person)


    if rentals.empty?
      puts "No rentals found for person: #{person}"
    else
      puts "Rentals for #{person}:"
      rentals.each { |rental| puts rental }
    end
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
end
