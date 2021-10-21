# rubocop:disable Metrics\CyclomaticComplexity, Metrics/MethodLength
require_relative 'books/book'
require_relative 'people/classroom'
require_relative 'people/person'
require_relative 'rentals/rental'
require_relative 'people/student'
require_relative 'people/teacher'
require_relative 'people/main'
require_relative 'books/main'
require_relative 'rentals/main'

class App
  attr_accessor :books, :people

  def initialize(people = [], books = [], rentals = [])
    @books = books
    @people = people
    @rentals = rentals
  end

  def run
    puts "Welcome to School Library App!\n\n"
    command = nil
    while command != '7'
      commands

      command = gets.chomp
      case command
      when '1'
        @books.list_books
      when '2'
        @people.list_people
      when '3'
        @people.create_person
      when '4'
        @books.create_book
      when '5'
        @rentals.create_rental(@books.books, @people.people)
      when '6'
        @rentals.list_rentals
      when '7'
        puts 'Thank you for using this app!'
      else
        puts 'Invalid option'
      end
    end
  end

  def commands
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end
end

def main
  people = PersonInitialize.new
  books = BookInitialize.new
  rentals = RentalInitialize.new
  app = App.new(people, books, rentals)
  app.run
end

main

# rubocop:enable Metrics\CyclomaticComplexity, Metrics/MethodLength
