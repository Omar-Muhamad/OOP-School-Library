require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, name = 'unkown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
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
