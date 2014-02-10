class AddStudentForm
  include ActiveModel::Model

  attr_reader :student

  delegate :first_name, :last_name, :username, :email, :password, to: :student

  def self.model_name
    Student.model_name
  end

  def initialize(student=nil)
    @student = student
  end

  def self.build
    student = Student.new(user: User.new)
    self.new(student)
  end

  def submit(params)
    student.user.attributes = params[:user_attributes].slice(
          :first_name,
          :last_name,
          :username,
          :email,
          :password
    )

    if valid?
      student.save!
    end
  end
end
