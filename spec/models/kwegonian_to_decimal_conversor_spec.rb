require 'spec_helper'

describe KwegonianToDecimalConversor, :type => :model do

	describe '#kwegonian_to_roman' do
		let(:kwegonian) {KwegonianToDecimalConversor.new}
		let(:kwegonian_entrada) {"polsx jij jinjin pol pol kil pol"}

		it 'testa a saída do método conversor de kwegonian para romano' do			
			expect(kwegonian.kwegonian_to_roman(kwegonian_entrada)).to eql("MCDXXIX")
		end
	end

	describe '#roman_to_decimal' do
		let(:kwegonian) {KwegonianToDecimalConversor.new}
		let(:roman_number) {"MCDXXIX"}

		it 'testa a saída do método conversor de romano para decimal' do			
			expect(kwegonian.roman_to_decimal(roman_number)).to eql(1429)
		end
	end
end