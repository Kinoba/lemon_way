# frozen_string_literal: true

def set_lemonway_configuration(login: 'Login', password: 'Password', company: 'LemonWay')
  LemonWay.configuration = {
    login: login,
    password: password,
    company: company,
    sandbox: true
  }
end
