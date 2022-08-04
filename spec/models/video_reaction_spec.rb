require 'rails_helper'

RSpec.describe VideoReaction, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:video) }
end
