#!/usr/bin/env ruby
class App
  def run
    puts 'Welcome to School Library App!'
  end
  
  def list_books; end

  def list_people; end

  def create_person; end

  def create_book; end

  def create_rental; end

  def list_rentals; end

end

def main
  app = App.new
  app.run
end

main
