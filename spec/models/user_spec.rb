# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '註冊功能' do
    let(:user) { create(:user, password: '12345678') }

    it 'username 不能重複' do
      username = 'hellokitty'
      create(:user, username:)

      expect do
        create(:user, username:)
      end.to raise_error(ActiveRecord::RecordInvalid)
    end

    it '使用者可以登入' do
      user_data = {
        account: user.username,
        password: '12345678'
      }

      expect(User.login(user_data)).not_to be nil
    end

    it '註冊時密碼會加密' do
      expect(user.password_digest.length).to be 60
    end
  end
end
