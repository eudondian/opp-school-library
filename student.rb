require './person'

class Student < Person
  def initialize(age, name = 'unknown', classroom:, parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
