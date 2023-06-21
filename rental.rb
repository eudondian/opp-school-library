class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @person = person
    @book = book

  def add_rentals(book, date)
    Rental.new(date, self, person)
  end
end
