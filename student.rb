require_relative 'Person'

class Student < Person
  def initialize(classroom, *args)
    super(*args)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
