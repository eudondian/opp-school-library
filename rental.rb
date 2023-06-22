# frozen_string_literal: true

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @person = person
    @book = book
  end

  def add_rentals(_book, date)
    Rental.new(date, self, person)
  end
end
