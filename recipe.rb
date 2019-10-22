class Recipe
  attr_reader :name, :description, :prep_time, :difficulty
  def initialize(name, description, prep_time, read = false, difficulty = '')
    @name = name
    @description = description
    @prep_time = prep_time
    @read = read
    @difficulty = difficulty
  end

  def read?
    @read
  end

  def mark_as_read!
    @read = true
  end
end
