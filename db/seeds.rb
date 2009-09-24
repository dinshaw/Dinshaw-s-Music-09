User.delete_all
File.open("db/users.txt") do |file|
  file.readlines.each do |email|
    puts email
    u = User.create!(:email => email.strip.chomp, :password => 'password', :password_confirmation => 'password')
    u.register!
    u.activate!
  end
end
