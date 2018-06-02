require 'rails_helper'

RSpec.describe Student, type: :model do

  let(:email) { "test_student@example.com" }
  subject(:user) { create :student, email: email }

  it { should respond_to(:email) }

  it "#email returns a string" do
    expect(user.email).to match email
  end

end
