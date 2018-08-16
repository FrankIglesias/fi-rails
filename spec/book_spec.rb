require 'rails_helper'

describe Book, type: :model do
  it { is_expected.to validate_presence_of(:genre) }
  it { is_expected.to validate_presence_of(:author) }
  it { is_expected.to validate_presence_of(:image) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:publisher) }
  it { is_expected.to validate_presence_of(:year) }

  subject(:book) do
    Book.new(
      genre: genre, author: author, image: image, title: title, publisher: publisher, year: year
    )
  end

  let(:genre) { Faker::Name.first_name }
  let(:author) { Faker::Name.name }
  let(:image) { Faker::LoremPixel.image('50x60', true) }
  let(:title) { Faker::LordOfTheRings.character }
  let(:publisher) { Faker::Team.state }
  let(:year) { Faker::Date.between(2.days.ago, Date.today) }

  it do
    is_expected.to be_valid
  end

  describe '#create' do
    context 'When the genre is nil' do
      let(:genre) { nil }
      it { is_expected.to be_invalid }
    end
  end
end
