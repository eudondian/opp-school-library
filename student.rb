require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name = 'unknown', classroom, parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def add_classroom(classroom)
    @classroom.student = classroom
    classroom.students.push(self) unless classroom.students.iclude?(self)
  end
end
