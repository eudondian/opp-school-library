# frozen_string_literal: true

class Nameable
  def correct_name
    raise NotImplemetedError, 'This method is a must for subclasses'
  end
end
