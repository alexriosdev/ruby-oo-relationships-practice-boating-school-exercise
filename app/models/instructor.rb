class Instructor

  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    self.class.all << self
  end

  def all_tests
    BoatingTest.all.select { |btest| btest.instructor == self }
  end

  def passed_students
    passed = all_tests.select { |btest| btest.test_status == "passed" }
    passed.map { |btest| btest.student }.uniq
  end

  def pass_student(student, test_name)
    found_test = all_tests.find { |btest| btest.student == student && btest.test_name == test_name }
    if found_test != nil
      found_test.test_status = "passed"
    else
      BoatingTest.new(student, test_name, "passed", self)
    end
  end

  def fail_student(student, test_name)
    found_test = all_tests.find { |btest| btest.student == student && btest.test_name == test_name }
    if found_test != nil
      found_test.test_status = "failed"
    else
      BoatingTest.new(student, test_name, "failed", self)
    end
  end

  def all_students
    all_tests.map { |btest| btest.student }.uniq
  end

  def self.all
    @@all
  end

end