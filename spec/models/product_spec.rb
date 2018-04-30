require 'rails_helper'

RSpec.describe Product, type: :model do
  subject { 
    described_class.new(name: "Anything", price_cents: 100, quantity: 1, category_id: 1)
  }

  describe 'validations' do
    it 'are valid with valid attribute' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
      expect { raise subject }.to raise_error(StandardError)
    end

    it 'is not valid without a price' do
      subject.price_cents = nil
      expect(subject).to_not be_valid
      expect { raise subject }.to raise_error(StandardError)
    end

    it 'is not valid without a quantity' do
      subject.quantity = nil
      expect(subject).to_not be_valid
      expect { raise subject }.to raise_error(StandardError)
    end

    it 'is not valid without a category' do
      subject.category_id = nil
      expect(subject).to_not be_valid
      expect { raise subject }.to raise_error(StandardError)
    end
  end
end
