require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User Validations' do
    context 'Given all fields, email is unique AND password is minumum length' do
      it 'Passes validation' do
      user = User.new(first_name:'J', last_name:'R', email:'test@test.com', password:'12', password_confirmation:'12')
      expect(user).to be_valid
      puts user.errors.full_messages
      end
    end

    context 'Given all fields, email is NOT UNIQUE' do
      it 'Fails validation' do
      user1 = User.create(first_name:'J', last_name:'R', email:'test@test.com', password:'12', password_confirmation:'12')
      user2 = User.create(first_name:'Jay', last_name:'Ram', email:'tesT@test.com', password:'12', password_confirmation:'12')
      expect(user2).not_to be_valid
      puts user2.errors.full_messages
      end
    end

    context 'Given a password UNDER minimum length' do
      it 'Fails validation' do
      user = User.new(first_name: 'JJ', last_name:'RR', email:'test2@test.com', password:'1', password_confirmation:'1')
      expect(user).not_to be_valid
      puts user.errors.full_messages
      end
    end
  end
end
