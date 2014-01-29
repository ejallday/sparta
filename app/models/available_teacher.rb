class AvailableTeacher
  def self.for_period(period)
    Teacher.all.reject do |teacher|
      teacher.courses.map(&:period).include?(period)
    end
  end
end
