class Admin < User
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable
  include Gravtastic
  gravtastic
end
