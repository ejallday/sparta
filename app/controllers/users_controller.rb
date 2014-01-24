class UsersController < Clearance::UsersController

  private

  def user_from_params
    user_params = permitted_params

    first_name = user_params.delete(:first_name)
    last_name = user_params.delete(:last_name)
    username = user_params.delete(:username)
    email = user_params.delete(:email)
    password = user_params.delete(:password)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.username = username
      user.first_name = first_name
      user.last_name = last_name
    end
  end

  def permitted_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
  end
end
