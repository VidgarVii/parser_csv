require_relative '../lib/cable_parser'

RSpec.describe 'CableParser' do
  subject { CableParser.new('Провод АПБ 5,20х12,50/0,45 прям.сеч.;т;0,012') }

  it '#response should return hash' do
    expect(subject.response).to be_is_a(Hash)
  end
end
