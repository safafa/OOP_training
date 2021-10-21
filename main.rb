# rubocop:disable Metrics\CyclomaticComplexity, Metrics/MethodLength
require_relative 'books/book'
require_relative 'classroom'
require_relative 'people/person'
require_relative 'rental'
require_relative 'people/student'
require_relative 'people/teacher'
require_relative 'people/main'
require_relative 'books/main'

class App
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
        create_rental
      when '6'
        list_rentals
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

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }

    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    person_index = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    rental = Rental.new(date, @books[book_index], @people[person_index])

    @rentals << rental
    puts 'Rental created successfully'
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i

    puts 'Rentals:'

    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
    end
    puts ''
  end
end

def main
  people = PersonInitialize.new
  books = BookInitialize.new
  app = App.new(people, books)
  app.run
end

main

# rubocop:enable Metrics\CyclomaticComplexity, Metrics/MethodLength