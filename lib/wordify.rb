class Fixnum
  def wordify

    words = [
      {
        "0" => "",
        "1" => "one",
        "2" => "two",
        "3" => "three",
        "4" => "four",
        "5" => "five",
        "6" => "six",
        "7" => "seven",
        "8" => "eight",
        "9" => "nine"
      },
      {
        "0" => "ten",
        "1" => "eleven",
        "2" => "twelve",
        "3" => "thirteen",
        "4" => "fourteen",
        "5" => "fifteen",
        "6" => "sixteen",
        "7" => "seventeen",
        "8" => "eighteen",
        "9" => "nineteen"
      },
      {
        "0" => "",
        "2" => "twenty",
        "3" => "thirty",
        "4" => "forty",
        "5" => "fifty",
        "6" => "sixty",
        "7" => "seventy",
        "8" => "eighty",
        "9" => "ninety"
      },
      ["","thousand","million","billion","trillion"]
    ]

    num_array = self.to_s.split("").reverse
    # self = 1984 num_array = ["4","8","9","1"]
    # tri_array = [["4","8","9"]["1"]]
    tri_array = []
    trans_array = []

    num_array.each_with_index() do |num, index|
      if index % 3 == 0
        tri_array.push([])
      end
      tri_array[index/3].push(num)
    end

    tri_array.each_with_index() do |little_array, index|
      if little_array != ["0","0","0"]
        trans_array.push(words[3][index])
      end

      if little_array[1].eql?("1")
        trans_array.push(words[1].fetch(little_array[0])) #teens code
      else
        trans_array.push(words[0].fetch(little_array[0])) #ones code
        if little_array.length != 1
          trans_array.push(words[2].fetch(little_array[1])) #tens code
        end
      end

      if (little_array.length == 3).&(!little_array[2].eql?("0"))
        trans_array.push(words[0].fetch(little_array[2]) + " hundred")
      end
    end

    trans_array.delete("")
    trans_array.reverse.join(" ")
  end
end
