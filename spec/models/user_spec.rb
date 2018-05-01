require 'rails_helper'

RSpec.describe User, type: :model do 
  describe 'Validations' do
    it 'is valid with valid attributes' do
      @user = User.new(:first_name => 'first', :last_name => 'last', :email => 'name@email.com', :password => 'password', :password_confirmation => 'password')
      expect(@user).to be_valid
    end

    it 'is not be valid without a password' do
      @user = User.new(:first_name => 'first', :last_name => 'last', :email => 'name@email.com', :password => nil)
      expect(@user).to_not be_valid
    end

    it 'is not be valid without email' do
      @user = User.new(:first_name => 'first', :last_name => 'last', :email => nil, :password => 'password')
      expect(@user).to_not be_valid
    end

    it 'is not be valid without first name' do
      @user = User.new(:first_name => nil, :last_name => 'last', :email => 'name@email.com', :password => 'password')
      expect(@user).to_not be_valid
    end

    it 'is not be valid without last name' do
      @user = User.new(:first_name => 'first', :last_name => nil, :email => 'name@email.com', :password => 'password')
      expect(@user).to_not be_valid
    end

    it 'is not be valid if email isnt unique' do
      User.create!(:first_name => 'first', :last_name => 'last', :email => 'name@email.COM', :password => 'password', :password_confirmation => 'password')
      @user = User.new(:first_name => 'first', :last_name => 'last', :email => 'NAME@EMAIL.com', :password => 'password', :password_confirmation => 'password')
      expect(@user).to_not be_valid
    end

    it 'is not be valid without a password confirmation' do
      @user = User.new(:first_name => 'first', :last_name => 'last', :email => 'NAME@EMAIL.com', :password => 'password', :password_confirmation => nil)
      expect(@user).to_not be_valid
    end

    it 'is not be valid if password and confirmation dont match' do
      @user = User.new(:first_name => 'first', :last_name => 'last', :email => 'NAME@EMAIL.com', :password => 'password', :password_confirmation => 'WrongPassword')
      expect(@user).to_not be_valid
    end

    it 'has a minimum password length of 8' do
      @user = User.new(:first_name => 'first', :last_name => 'last', :email => 'name@email.com', :password => 'assword', :password_confirmation => 'assword')
      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'returns nil if there is no email address' do
      @user = User.new(:first_name => 'first', :last_name => 'last', :email => 'name@email.com', :password => 'password', :password_confirmation => 'password')
      expect(User.authenticate_with_credentials('name@email.com', nil)).to equal nil
    end

    it 'is not valid if there is no password' do
      @user = User.new(:first_name => 'first', :last_name => 'last', :email => 'name@email.com', :password => 'password', :password_confirmation => 'password')
      expect(User.authenticate_with_credentials('name@email.com', nil)).to equal nil
    end

    it 'is false if the email doesnt match the password' do
      @user = User.new(:first_name => 'first', :last_name => 'last', :email => 'name@email.com', :password => 'password', :password_confirmation => 'password')
      expect(User.authenticate_with_credentials('name@email.com', 'wrongpassword')).to be nil
    end

    it 'returns an instance of the user if authenticated' do
      @user = User.create!(:first_name => 'first', :last_name => 'last', :email => 'name@email.com', :password => 'password', :password_confirmation => 'password')
      expect(User.authenticate_with_credentials('name@email.com', 'password')).to_not be nil
    end

    it 'authenticates even if the user has extra spaces before their email' do
      @user = User.create!(:first_name => 'first', :last_name => 'last', :email => 'name@email.com', :password => 'password', :password_confirmation => 'password')
      expect(User.authenticate_with_credentials('  name@email.com', 'password')).to_not be nil
    end

    it 'authenticates even if the user has extra spaces after their email' do
      @user = User.create!(:first_name => 'first', :last_name => 'last', :email => 'name@email.com', :password => 'password', :password_confirmation => 'password')
      expect(User.authenticate_with_credentials('name@email.com    ', 'password')).to_not be nil
    end

    it 'isnt case sensitive for authenticating email' do
      @user = User.create!(:first_name => 'first', :last_name => 'last', :email => 'naMe@email.com', :password => 'password', :password_confirmation => 'password')
      expect(User.authenticate_with_credentials('NAmE@EMAiL.CoM', 'password')).to_not be nil
    end
  end
end