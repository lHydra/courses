User.seed(:id,
  { :id => 1, :email => "admin@email.com",   password: 'qwerty', password_confirmation: 'qwerty' },
  { :id => 2, :email => "emily@example.com", password: 'qwerty', password_confirmation: 'qwerty' },
  { :id => 3, :email => "john@example.com", password: 'qwerty', password_confirmation: 'qwerty' },
  { :id => 4, :email => "den@example.com", password: 'qwerty', password_confirmation: 'qwerty' },
  { :id => 5, :email => "jack@example.com", password: 'qwerty', password_confirmation: 'qwerty' }
)

User.first.add_role :admin
