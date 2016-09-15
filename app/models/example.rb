class Example < ActiveRecord::Base
  def as_json(*)
    {
      parse: parse,
      date: date,
      cup: cup,
      flower: flower.upcase,
    }
  end

  def parse
    "My Example is: #{cup} #{flower} #{date}"
  end
end