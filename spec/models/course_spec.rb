require 'rails_helper'

RSpec.describe Course, type: :model do
  it { should have_and_belong_to_many :user }
end
