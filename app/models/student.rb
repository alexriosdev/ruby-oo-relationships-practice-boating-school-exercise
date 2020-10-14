class Student

  attr_reader :first_name
  @@all = []

  def initialize(first_name)
    @first_name = first_name
    self.class.all << self
  end

  def add_boating_test(test_name, test_status, instructor)
    BoatingTest.new(self, test_name, test_status, instructor)
  end

  def all_tests
    BoatingTest.all.select { |btest| btest.student == self }  
  end
  
  def passed_tests
    all_tests.select { |btest| btest.test_status == "passed" }
  end

  def grade_percentage
    grade = (passed_tests.size.to_f / all_tests.size) * 100.0
    grade.round(2)
  end

  def all_instructors
    all_tests.map { |btest| btest.instructor }.uniq
  end

  def self.all
    @@all
  end

  def self.find_student(name)
    self.all.find { |student| student.first_name == name }
  end

end