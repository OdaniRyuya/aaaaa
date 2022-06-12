require 'rails_helper'

RSpec.describe 'ProductAPI' do
  it 'リクエストが成功しているか' do
    expect(response.status).to eq(200)
  end
end
