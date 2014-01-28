class AvailableTeacher
  def self.for_period(period)
    User.joins(:courses).where.not('courses.period' => period)
  end
end
