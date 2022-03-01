require_relative 'Person'

class Teacher < Person
  def initialize(specialization, *args)
    super(*args)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
