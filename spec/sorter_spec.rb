require 'spec_helper'
require_relative '../lib/record'
require_relative '../lib/sorter'

describe Sorter do
  include Sorter

  let(:sara) { Record.new(last_name: 'Lee', first_name: 'Sara', gender: 'Female',
                          dob: '01/23/1911', favorite_color: 'Purple') }

  let(:sebastian) { Record.new(last_name: 'Dear', first_name: 'Sebastian',
                               gender: 'Male', dob: '09/23/2011',
                               favorite_color: 'White') }

  let(:sofi) { Record.new(last_name: 'Rios', first_name: 'Sofi',
                          gender: 'Female', dob: '11/12/2012',
                          favorite_color: 'Green') }

  let(:olivier) { Record.new(last_name: 'Sarkozy', first_name: 'Olivier',
                             gender: 'Male', dob: '5/5/1993', favorite_color: 'Blue') }

  let(:records_array) { [sebastian, sofi, olivier, sara] }

  describe '#sort_by_gender' do
    it 'sorts records by gender, females first then last name asc' do
      expect(sort_by_gender(records_array)).to eq([sara, sofi, sebastian, olivier])
    end
  end

  describe '#sort_by_dob' do
    it 'sorts records  by dob asc' do
      expect(sort_by_dob(records_array)).to eq([sara, olivier, sebastian, sofi])
    end
  end

  describe '#sort_by_last_name' do
    it 'sorts records by last name desc' do
      expect(sort_by_last_name(records_array)).to eq([olivier, sofi, sara, sebastian])
    end
  end

  describe '#convert_to_date' do
    it 'converts a date string to a date object' do
      expect(convert_to_date('2/6/2014')).to eq(DateTime.new(2014, 2, 6))
    end
  end
end
