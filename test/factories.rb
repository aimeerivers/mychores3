Factory.define :user do |u|
  u.name                  'test user'
  u.login                 'testuser'
  u.email                 'test@test.com'
  u.password              'password'
  u.password_confirmation 'password'
end
