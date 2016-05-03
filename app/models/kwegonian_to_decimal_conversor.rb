class KwegonianToDecimalConversor
	#não vai ser persistido no banco
	extend ActiveModel::Naming
    include ActiveModel::Conversion
    def persisted?
      false
    end

	attr_accessor :entrada_kwegonian
	attr_accessor :saida_decimal

	def kwegonian_to_roman kwegonian_entrada
		palavra_roman = ""
		kwegonian_entrada.split.each do |palavra_kwegonian|
			case palavra_kwegonian
			when "kil"
				palavra_roman += 'I'
			when "jin"
				palavra_roman += 'V'
			when "pol"
				palavra_roman += 'X'
			when "kilow"
				palavra_roman += 'L'
			when "jij"
				palavra_roman += 'C'
			when "jinjin"
				palavra_roman += 'D'
			when "polsx"
				palavra_roman += 'M'
			end
		end
		palavra_roman
	end

	def get_decimal_value_roman roman_number
		case roman_number
		when 'M'
			return 1000
		when 'CM'
			return  900
		when 'D'
			return  500
		when 'CD'
			return  400
		when 'C'
			return  100
		when 'XC'
			return  90
		when 'L'
			return  50
		when 'XL'
			return  40
		when 'X'
			return  10
		when 'IX'
			return  9
		when 'V'
			return  5
		when 'IV'
			return 4
		when 'I'
			return  1
		end
	end

	def roman_to_decimal roman_entrada
		decimal = 0

		return nil if roman_entrada.empty? #número kwegonian é inválido

		while !roman_entrada.empty?
			romano_unico = get_decimal_value_roman(roman_entrada[0])
			par_romano = get_decimal_value_roman(roman_entrada[0..1])
			#compara sempre qual o maior: o primeiro caractere ou o primeiro e segundo 
			#caracteres do número romano concatenados. 
			if par_romano.nil? #XV por exemplo, não é um número romano válido, por isso o par_romano será nil nesse caso
				decimal += get_decimal_value_roman(roman_entrada[0])
				roman_entrada.slice!(0)
			elsif romano_unico > par_romano
				decimal += get_decimal_value_roman(roman_entrada[0])
				roman_entrada.slice!(0)
			else
				decimal += get_decimal_value_roman(roman_entrada[0..1])
				roman_entrada.slice!(0..1)
			end
		end
		decimal
	end

end