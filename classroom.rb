require_relative 'student'

class Classroom 
  attr_accessor :label 
  attr_reader :student

  def initialize(label)
    @label = label
    @student = []
    @student.push(student)
    student.classroom = self
  end
end