def stub_lemonway_request(method, body = { wallet_id: 1 })
  stub_request(:any, [Lemonway::Client::DIRECTKIT_URL, method].join('/'))
    .and_return(body: { d: { 'WALLET': body } }.to_json)
end

def stub_error_lemonway_request(method, body = { code: 147 })
  stub_request(:any, [Lemonway::Client::DIRECTKIT_URL, method].join('/'))
    .and_return(body: { d: { 'E': body } }.to_json)
end
