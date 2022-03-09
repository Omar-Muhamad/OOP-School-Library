require '../classes/rental'
require '../classes/person'
require '../classes/book'

describe Rental do
  context "When testing the Rental class" do

    it "The initialize method should return create new Rental object" do
      book = Book.new('Harry Potter', 'J.K. Rowling')
      person = Person.new(20)
      date = "2222/2/2"
      rental = Rental.new(date, book, person)
      expect(rental.date).to eq "2222/2/2"
    end

  end 
end