require 'spec_helper'
require_relative '../lib/parser'
require_relative '../lib/record'

describe Parser do
  describe '::read' do
    let(:pipe_config) do
      { first_name: 1, last_name: 0, middle_initial: 2, gender: 3, dob: 5,
        favorite_color: 4 }
    end

    it 'returns an array of arrays from a CSV' do
      expect(Parser.read('./spec//support/test.csv')).to eq(
        [['Dear','Brian','Male','4/25/1977','Azure']])
    end

    it 'accepts a delimiter argument to parse a record set' do
      expect(Parser.read('./data_files/comma.txt', delimiter: ', ')).to eq(
        [['Abercrombie', 'Neil', 'Male', 'Tan', '2/13/1943'],
         ['Bishop', 'Timothy', 'Male', 'Yellow', '4/23/1967'],
         ['Kelly', 'Sue', 'Female', 'Pink', '7/12/1959']])
      expect(Parser.read('./data_files/pipe.txt', delimiter: ' | ')).to eq(
        [['Smith', 'Steve', 'D', 'M', 'Red', '3-3-1985'],
         ['Bonk', 'Radek', 'S', 'M', 'Green', '6-3-1975'],
         ['Bouillon','Francis', 'G', 'M', 'Blue', '6-3-1975']])
      expect(Parser.read('./data_files/space.txt', delimiter: ' ')).to eq(
        [['Kournikova', 'Anna', 'F', 'F', '6-3-1975', 'Red'],
         ['Hingis', 'Martina', 'M', 'F', '4-2-1979', 'Green'],
         ['Seles', 'Monica', 'H', 'F', '12-2-1973', 'Black']])
    end

    it 'allows a custom config and returns an array of Record objects' do
      records = Parser.read('./data_files/pipe.txt', delimiter: ' | ',
                            config: pipe_config)
      records.each do |record|
        expect(record).to be_an_instance_of(Record)
      end
    end
  end
end
