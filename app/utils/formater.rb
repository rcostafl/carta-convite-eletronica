class Formater
  def comma_as_decimal_separator(number)
    formatedNumber = number_with_delimiter(proposal.value, :delimiter => ',')
    integerPart = number.to_s.split('.')[0]
    decimalPart = number.to_s.split('.')[1]

    return "#{integerPart.gsub(',', '.')},#{decimalPart}"
  end
end
