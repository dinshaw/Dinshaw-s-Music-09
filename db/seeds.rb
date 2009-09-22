User.delete_all
File.open("db/users.txt") do |file|
  file.readlines.each do |email|
    p email
    User.create!(:email => email.strip.chomp, :password => 'password', :password_confirmation => 'password')
  end
end
