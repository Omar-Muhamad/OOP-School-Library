require_relative '../classes/person'

describe 'Create person object' do
  context 'given the valid inputs' do

    it 'should create a person with age = 10' do
      person = Person.new(20)
      expect(person.age).to eql(20)
    end

    it 'should create a person with age = 20 and called Omar' do
      person = Person.new(20, 'Omar')
      expect(person.age).to eql(20)
      expect(person.name).to match('Omar')
    end

    it "The can_use_services? method should return true" do
      person = Person.new(20, 'Kerolous')
      expect(person.can_use_services?).to be true
    end

    it "The validate_name method should return a valid name" do
      person = Person.new(20, 'kerolous')
      expect(person.validate_name).to eq 'Kerolous'
    end

    it "The add_rentals? method should add one rental" do
      person = Person.new(20, 'Kerolous')
      book = Book.new('Title 1', 'Author 1')
      date = '2202/2/2'
      person.add_rental(book, date)
      expect(person.rentals.length).to be 1
    end
  end
end
