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
  end
end
