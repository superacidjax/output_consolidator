require 'spec_helper'
require_relative '../lib/record'

describe Record do
  let(:record) { Record.new(last_name: 'Dear', first_name: 'Brian', gender: 'M',
                            dob: '4-25-1977', favorite_color: 'Azure') }

  describe '#last_name' do
    it 'has a last name' do
      expect(record.last_name).to eq('Dear')
    end
  end

  describe '#first_name' do
    it 'has a first name' do
      expect(record.first_name).to eq('Brian')
    end
  end

  describe '#gender' do
    it 'has non-abbreviated gener' do
      expect(record.gender).to eq('Male')
    end
  end

  describe '#dob' do
    it 'has a properly formatted date of birth' do
      expect(record.dob).to eq('4/25/1977')
    end
  end

  describe '#favorite_color' do
    it 'has a favorite color' do
      expect(record.favorite_color).to eq('Azure')
    end
  end



  describe '#to_string' do
    it 'outputs a string with all of the correct record information' do
      expect(record.to_string).to eq('Dear Brian Male 4/25/1977 Azure')
    end
  end
end
