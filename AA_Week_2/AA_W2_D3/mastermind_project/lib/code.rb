class Code

  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(arr)
    arr.all? { |ele| POSSIBLE_PEGS.keys.include?(ele.upcase)}  
  end

  def initialize(arr)
    if Code.valid_pegs?(arr)
       @pegs = arr.map { |ele| ele.upcase}
    else
      raise "Invalid Pegs"
    end
  end

  def self.random(len)
    res = []
    len.times { res << POSSIBLE_PEGS.keys.sample }
    Code.new(res)
  end

  def self.from_string(str)
    pegs = str.split("") #str.chars
    Code.new(pegs) # if Code.valid_pegs?(pegs)
  end

  def [](index)
    @pegs[index]
  end
  
  def length
    @pegs.length
  end

  def num_exact_matches(guess) 
    (0...pegs.length).count {|i| guess[i] == pegs[i]}
  end

  def num_near_matches(guess)
      (0...@pegs.length).count {|i| guess[i] != @pegs[i] && @pegs.include?(guess[i]) }   
  end
  
  def ==(code)
    self.num_exact_matches(code) == self.length && code.length == self.length
  end

  
end
