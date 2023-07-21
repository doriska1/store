# frozen_string_literal: true

def user_login(user)
  secret = Rails.application.secrets.secret_key_base.to_s

  payload = {
    user_id: user.id,
    exp: 24.hours.from_now.to_i
  }

  token = JWT.encode(payload, secret)
  request.headers['Authorization'] = "Bearer #{token}"
end
