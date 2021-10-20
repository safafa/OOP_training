class Rental
  attr_accessor :date

  def initialize(date, book, person)
    @date = date
    @book = book
    @book.rentals.push(self)
    @person = person
    @book.rentals.push(self)
  end
end
