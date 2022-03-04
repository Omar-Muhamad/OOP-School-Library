require_relative 'Person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, *args)
    super(*args)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  
  def add_classroom=(classroom)
    @classroom = classroom
    classroom.student.push(self)
  end
end

