# Courses

## Steps to start this application:

**Database creation and filling**

Download project

```
git@github.com:lHydra/courses.git
```

Start bundle install

```
bundle install
```

Start rake tasks.

```
rake db:create
rake db:migrate
rake db:seed_fu
```

**Start the application**

```
rails server
```

Open link in your browser: `http://localhost:3000`

Congratulations!

## Tests

Also you can run test with command

```console
rspec spec
```

## Seeds

Then seed the database with command

```console
rails db:seed_fu
```

Admin

```ruby
email: 'admin@email.com', password: 'qwerty'
```

Another user will create with *student* role
