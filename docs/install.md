
### [MuPDF](https://mupdf.com)

* MacOS

```bash
brew install mupdf
```

* Ubuntu

```
sudo apt-get update
sudo apt-get install mupdf mupdf-tools
```

### ERB Scaffold Template - bootstrap/simple_form/font-awesome-rails

```
cp ~/rails_new/templates/erb/scaffold/* ./lib/templates/erb/scaffold
```


### ActiveRecord Models

* User Models

```bash
rails generate devise users first_name last_name
```

```ruby
class Student < User
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable
end
class Supervisor < User
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable
end
class Admin < User
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable
end

```
