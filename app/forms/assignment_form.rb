class AssignmentForm

  def initialize(user)
    @user = user
  end

  def assignment
    @assignment ||= Assignment.new
  end

  def courses
    @courses ||= user.courses
  end

  def submit(attrs)
    Assignment.create(attrs)
  end

  private

  attr_reader :user
end
