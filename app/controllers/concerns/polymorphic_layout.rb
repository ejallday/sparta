module PolymorphicLayout
  extend ActiveSupport::Concern

  included do
    layout :polymorphic_layout
  end

  private

  def polymorphic_layout
    if current_user.teacher?
      'teacher'
    elsif current_user.admin?
      'admin'
    elsif current_user.guardian?
      'guardian'
    elsif current_user.student?
      'student'
    else
      'application'
    end
  end
end
