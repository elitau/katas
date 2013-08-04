require 'rspec/given'

class RomanNumeralsConverter
	DIGITS = {
		"I" => 1,
		"V" => 5,
		"X" => 10,
		"L" => 50,
		"C" => 100,
		"D" => 500,
		"M" => 1000,
	}
	def to_arabic(roman_number)
		current_numeral = 0
		roman_number.reverse.each_char.inject(0) do |number, char|
			current_numeral = DIGITS[char] if current_numeral < DIGITS[char]
			number += current_numeral > DIGITS[char] ? -DIGITS[char] : DIGITS[char]
		end
	end
end

describe RomanNumeralsConverter do
	Given(:converter) { RomanNumeralsConverter.new }

	def to_arabic(roman_number)
		converter.to_arabic(roman_number)
	end

	Then { to_arabic("I").should be(1) }
	Then { to_arabic("II").should be(2) }
	Then { to_arabic("IV").should be(4) }
	Then { to_arabic("V").should be(5) }
	Then { to_arabic("VI").should be(6) }
	Then { to_arabic("VII").should be(7) }
	Then { to_arabic("IX").should be(9) }
	Then { to_arabic("X").should be(10) }
	Then { to_arabic("XI").should be(11) }
	Then { to_arabic("XX").should be(20) }
	Then { to_arabic("XXII").should be(22) }
	Then { to_arabic("XXIV").should be(24) }
	Then { to_arabic("XC").should be(90) }
	Then { to_arabic("CCCLXIX").should be(369) }
	Then { to_arabic("MCMXCVIII").should be(1998) }
	Then { to_arabic("MMVIII").should be(2008) }
	Then { to_arabic("MMDCCLI").should be(2751) }
end
