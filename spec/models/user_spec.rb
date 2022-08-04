require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:videos) }
  it { is_expected.to have_many(:video_reactions) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }
end
