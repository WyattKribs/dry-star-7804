require 'rails_helper'

RSpec.describe Patient do
  it {should have_many :doctors}
end
