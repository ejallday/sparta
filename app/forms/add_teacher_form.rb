class AddTeacherForm
  include ActiveModel::Model

  attr_reader :teacher

  delegate :first_name, :last_name, :username, :email, :password, to: :teacher

  def self.model_name
    Teacher.model_name
  end

  def initialize(teacher=nil)
    @teacher = teacher
  end

  def self.build
    teacher = Teacher.new(user: User.new)
    self.new(teacher)
  end

  def submit(params)
    teacher.user.attributes = params[:user_attributes].slice(
          :first_name,
          :last_name,
          :username,
          :email,
          :password
    )

    if valid?
      teacher.save!
    end
  end
end
