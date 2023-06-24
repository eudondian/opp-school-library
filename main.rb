# frozen_string_literal: true

require_relative 'app'

# rubocop:disable all
class Main
  def initialize
    @people = []
    @books = []
    @rentals = []
    @title = ''
    @author = ''
  end

  def main
    # app = App.new

    loop do
      print_menu_options
      choice = gets.chomp.to_i

      case choice
      when 1
        list_all_books
      when 2
        list_all_people
      when 3
        create_person
      when 4
        create_book
      when 5
        create_rental
      when 6
        list_rentals_for_person
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

   main_method = Main.new
  main_method.main
end
# rubocop:enable all
