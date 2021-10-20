#!/usr/bin/env ruby
require_relative 'book'
require_relative 'classroom'
require_relative 'person'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def run
    puts "Welcome to School Library App!\n\n"
    command = nil
    while command != '7'
      commands
      
      command = gets.chomp
      case command
      when '1'
        list_books
      when '2'
        list_people
      when '3'
        create_person
      when '4'
        create_book
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
  
  def list_books; end

  def list_people; end

  def create_person; end

  def create_book;  end

  def create_rental; end

  def list_rentals; end

end

def main
  app = App.new
  app.run
end

main
