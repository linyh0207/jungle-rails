require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'shoud be valid if password = password_confirmation ' do
      @user = User.create!(
        name: 'First User',
        email: 'first@user.com',
        password: '123456',
        password_confirmation: '123456'
      )
      expect(@user).to be_valid
    end

    it 'shoud not be valid if email is not unique ' do
      user1 = User.create(
        name: 'User 1',
        email: 'first@user.com',
        password: '654321',
        password_confirmation: '654321'
      )
      user2 = User.create(
        name: 'User 2',
        email: 'first@user.com',
        password: '123456',
        password_confirmation: '123456'
      )
      expect(user2).to_not be_valid
    end

    it 'shoud not be valid if name is missing ' do
      @user = User.create(
        name: nil,
        email: 'first@user.com',
        password: '123456',
        password_confirmation: '123456'
      )
      expect(@user).to_not be_valid
    end

    it 'shoud not be valid if name is missing ' do
      @user = User.create(
        name: nil,
        email: 'first@user.com',
        password: '123456',
        password_confirmation: '123456'
      )
      expect(@user).to_not be_valid
    end

    it 'shoud not be valid if exceeds password length limitation ' do
      @user = User.create(
        name: 'First User',
        email: 'first@user.com',
        password: '12',
        password_confirmation: '12'
      )
      expect(@user).to_not be_valid
    end
    
    it 'shoud not be valid if exceeds password length limitation ' do
      @user = User.create(
        name: 'First User',
        email: 'first@user.com',
        password: '12',
        password_confirmation: '12'
      )
      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should return user with valid email and password ' do
      user = User.create(
        name: 'First User',
        email: 'first@user.com',
        password: '123456',
        password_confirmation: '123456'
      )

      user.authenticate_with_credentials = expect(user).to be_valid
    end

    it 'should fetch the right email with space for email input field ' do
      user = User.create(
        name: 'First User',
        email: ' first@user.com',
        password: '123456',
        password_confirmation: '123456'
      )

      expect(user).to be_valid
    end

    it 'email should not be case sensitive  ' do
      user = User.create(
        name: 'First User',
        email: ' fRst@usEr.com',
        password: '123456',
        password_confirmation: '123456'
      )
      
      expect(user).to be_valid
    end
  end
end
