require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'validates all fields are filled in' do
      user = User.create(
        first_name: 'Miers',
        last_name: 'X',
        email: 'miersx@github.com',
        password: 'rails',
        password_confirmation: 'rails'
      )
      expect(user).to be_valid
    end

    it 'validates that no user is created when password and confirmation do not match' do
      user = User.create(
        first_name: 'Miers',
        last_name: 'X',
        email: 'miersx@github.com',
        password: 'rails',
        password_confirmation: 'banana'
      )
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'validates that emails need to be unique, case-insensitive' do
      user = User.create(
        first_name: 'Miers',
        last_name: 'X',
        email: 'miersx@github.com',
        password: 'rails',
        password_confirmation: 'rails'
      )

      user2 = User.create(
        first_name: 'Jeff',
        last_name: 'Daniels',
        email: 'MIERSX@github.com',
        password: 'orange',
        password_confirmation: 'orange'
      )

      expect(user).to be_valid
      expect(user2).not_to be_valid
      expect(user2.errors.full_messages).to include 'Email has already been taken'
    end

    it 'validates that an email exists' do
      user = User.create(
        first_name: 'Miers',
        last_name: 'X',
        email: nil,
        password: 'rails',
        password_confirmation: 'rails'
      )

      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include "Email can't be blank"
    end

    it 'validates that a first name exists' do
      user = User.create(
        first_name: nil,
        last_name: 'X',
        email: 'miersx@github.com',
        password: 'rails',
        password_confirmation: 'rails'
      )

      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include "First name can't be blank"
    end

    it 'validates that a last name exists' do
      user = User.create(
        first_name: 'Miers',
        last_name: nil,
        email: 'miersx@github.com',
        password: 'rails',
        password_confirmation: 'rails'
      )

      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include "Last name can't be blank"
    end

    it 'validates that a password is at least 5 characters long' do
      user = User.create(
        first_name: 'Miers',
        last_name: 'X',
        email: 'miersx@github.com',
        password: 'r',
        password_confirmation: 'r'
      )

      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include 'Password is too short (minimum is 5 characters)'
    end
  end


  describe '.authenticate_with_credentials' do

    it 'authenticates valid credentials' do
      user = User.new(
        first_name: 'Miers',
        last_name: 'X',
        email: 'miersx@github.com',
        password: 'rails',
        password_confirmation: 'rails'
      )
      user.save!

      authorize = User.authenticate_with_credentials(user.email, user.password)
      expect(authorize).to eq user


    end

    it 'does not authenticate invalid email' do
      user = User.new(
        first_name: 'Miers',
        last_name: 'X',
        email: 'miersx@github.com',
        password: 'rails',
        password_confirmation: 'rails'
      )
      user.save!

      authorize = User.authenticate_with_credentials("wrong email", user.password)
      expect(authorize).to eq nil

    end

    it 'does not authenticate invald password' do
      user = User.new(
        first_name: 'Miers',
        last_name: 'X',
        email: 'miersx@github.com',
        password: 'rails',
        password_confirmation: 'rails'
      )
      user.save!

      authorize = User.authenticate_with_credentials(user.email, "bad password")
      expect(authorize).to eq nil

    end

    it 'authenticates email with whitespace' do
      user = User.new(
        first_name: 'Miers',
        last_name: 'X',
        email: 'miersx@github.com',
        password: 'rails',
        password_confirmation: 'rails'
      )
      user.save!

      authorize = User.authenticate_with_credentials("miersx@github.com" + "  ", user.password)
      expect(authorize).to eq user

    end

    it 'authenticates email with incorrect casing' do
      user = User.new(
        first_name: 'Miers',
        last_name: 'X',
        email: 'miersx@github.com',
        password: 'rails',
        password_confirmation: 'rails'
      )
      user.save!

      authorize = User.authenticate_with_credentials("miERSx@github.com", user.password)
      expect(authorize).to eq user
      

    end


  end


end

