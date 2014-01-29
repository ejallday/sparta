email = 'eric@swotbot.org'
password = 'password'
say "Creating admin user with credentials: #{email}:#{password}..."
User.find_or_create_by!(email: email) do |u|
  u.first_name = 'Eric'
  u.last_name = 'Allen'
  u.password = password,
  u.username = 'ericallen'
  u.admin = true
end
