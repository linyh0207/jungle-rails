require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should not be valid if password != password_confirmation' do
    user = User.create()
    password != password_confirmation
    expect(product).to_not be_valid
  end
end
