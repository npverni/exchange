class Numeric
  def round_to( decimals=0 )
    factor = 10.0**decimals
    (self*factor).round / factor
  end
end
