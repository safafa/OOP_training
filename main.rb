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
  
  def list_books
    @books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
    puts ''
  end

  def list_people
    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    puts ''
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp

    case option
    when '1'
      print 'Age: '
      age = gets.chomp

      print 'Name: '
      name = gets.chomp

      print 'Has parent permission? [y/n]: '
      parent_permission = gets.chomp == 'y'

      student = Student.new(age, name, parent_permission)
      @people << student
    when '2'
      print 'Age: '
      age = gets.chomp

      print 'Name: '
      name = gets.chomp

      print 'Specialization: '
      specialization = gets.chomp

      teacher = Teacher.new(age, specialization, name)
      @people << teacher
    end
    puts 'Person created successfully'
    puts ''
  end

  def create_book
    print 'Title : '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book

    puts 'Book created successfully'
    puts ''
  end

  def create_rental; end

  def list_rentals; end

end

def main
  app = App.new
  app.run
end

main
