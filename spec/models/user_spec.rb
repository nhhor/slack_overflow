require 'rails_helper'

describe User do
  it 'creates a new user' do
    @user = FactoryBot.create(:user)
    @user.email = 'person@mail.com'
    @user.password.should eq 'password123'
    expect(@user.password_confirmation).to(eq('password123'))
  end

  it 'authenticates a new user' do
    @user = FactoryBot.create(:user)
    expect(@user.authenticate(@user.email, @user.password).to eq 'w')
  end

end
