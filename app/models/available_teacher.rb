class AvailableTeacher
  def self.for_period(period)
    User.all.select do |user|
      user.courses.any? && !user.courses.map(&:period).include?(period)
    end
  end
end
