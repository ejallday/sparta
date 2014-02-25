def say(message)
  puts message, '='*80
end

require_relative 'seeds/admin'
require_relative 'seeds/teachers'
require_relative 'seeds/students'
require_relative 'seeds/enrollments'
