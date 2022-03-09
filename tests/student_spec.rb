require_relative '../classes/student'

describe 'Create student object' do
  context 'given the valid inputs' do
    it 'should create a student with classroom = 10 and age = 16' do
      student = Student.new(10, 16)
      expect(student.classroom).to eql(10)
      expect(student.age).to eql(16)
    end
    it 'should create a student with classroom = 10, age = 16, and name = Omar ' do
      student = Student.new(10, 16, 'Omar')
      expect(student.classroom).to eql(10)
      expect(student.age).to eql(16)
      expect(student.name).to eql('Omar')
    end
  end
end
