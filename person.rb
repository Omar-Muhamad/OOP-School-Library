class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'unkown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    true if parent_permission
    false
  end

  private

  def of_age?
    true if age >= 18
    false
  end
end
