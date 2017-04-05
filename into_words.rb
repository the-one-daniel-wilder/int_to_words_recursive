class Fixnum

  ONES = {
    '0' => "zero",
    '1' => "one",
    '2' => "two",
    '3' => "three",
    '4' => "four",
    '5' => "five",
    '6' => "six",
    '7' => "seven",
    '8' => "eight",
    '9' => "nine"
    		  }

  TWEENS = {
    '10' => "ten",
    '11' => "eleven",
    '12' => "twelve"
    		  }

  TEENS = {
    '13' => "thirteen",
    '14' => "fourteen",
    '15' => "fifteen",
    '16' => "sixteen",
    '17' => "seventeen",
    '18' => "eighteen",
    '19' => "nineteen"
  		    }

  TENS = {
    '10' => "ten",
    '20' => "twenty",
    '30' => "thirty",
    '40' => "forty",
    '50' => "fifty",
    '60' => "sixty",
    '70' => "seventy",
    '80' => "eighty",
    '90' => "ninety"
  		    }

  PREFIX_NUMS = {
    "000" => "thousand",
    "000000" => "million",
    "000000000" => "billion",
    "000000000000" => "trillion"
  		    }


  def in_words
    raise 'please enter a whole number' unless self >= 0

    if self < 10
      return ONES[self.to_s]
    elsif self < 13
      return TWEENS[self.to_s]
    elsif self < 20
      return TEENS[self.to_s]
    end


    if self < 100
      dec_nums
    elsif self < 1000
      cent_nums
    elsif self >= 1000
      mill_nums
    end
  end


  private

  def dec_nums
    nums = self.to_s.split('')
    tens, ones = nums[-2] + "0", nums[-1]

    if ones == "0"
      TENS[tens]
    else
      "#{tens.to_i.in_words} #{ones.to_i.in_words}"
    end
  end

  def cent_nums
    nums = self.to_s.split('')
    hundreds, ten_one = nums[0..-3].join.to_i, nums[-2..-1].join.to_i

    if self % 100 == 0
      "#{hundreds.in_words} hundred"
    else
      "#{hundreds.in_words} hundred #{ten_one.in_words}"
    end
  end

  def mill_nums
    nums = self.to_s.split('')
    leftover = []

    until nums.length <= 3
      3.times { leftover << nums.pop }
    end

    leftover.reverse!
    num = nums.join.to_i

    if leftover.join.to_i == 0
      "#{num.in_words} #{PREFIX_NUMS["0" * leftover.length]}"
    else
      "#{num.in_words} #{PREFIX_NUMS["0" * leftover.length]} #{leftover.join.to_i.in_words}"
    end

  end

end
