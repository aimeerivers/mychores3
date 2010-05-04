Factory.define :user do |u|
  u.login                 'testuser'
  u.password              'password'
  u.password_confirmation 'password'
  u.person                Person.new(:email => 'myemail@test.com')
end
