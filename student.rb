require_relative 'Person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, *args)
    super(*args)
    @classroom = classroom
    classroom.student.push(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
