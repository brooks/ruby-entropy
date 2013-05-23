class RubyEntropy

  attr_reader :passphrase
  
  #lowercase only
  COMMON_PASSPHRASES = ["admin", "administrator", "jesus", "letmein", "master", "open sesame", "opensesame", "password", "passphrase", "sunshine", "trustnoi", "trustnol", "welcome"]
  KEY_PATTERNS = ["zxc", "cxz", "bnm", "mnb", "jkl", "lkj", "asd", "dsa", "qwe", "ewq", "iop", "poi"]

  def initialize(passphrase)
    @passphrase = passphrase
  end

  def strength
    (31 * bad_passphrase_multiplier * Math.log(entropy / 13.62)).round(2)
  end

  def entropy
    Math.log2(count ** length)
  end

  def length
    @passphrase.length
  end

  def letters
    26 if @passphrase.match(/[a-z]|[A-Z]/)
  end
   
  def multiple_cases
    26 if @passphrase.match(/[a-z]/) && @passphrase.match(/[A-Z]/)
  end

  def digits
    10 if @passphrase.match(/\d/) 
  end

  def symbols
    33 if @passphrase.match(/\W/)
  end

  def count
    letters.to_i + multiple_cases.to_i + digits.to_i + symbols.to_i
  end

  def key_pattern?
    KEY_PATTERNS.each { |pattern| return true if @passphrase.downcase.include?(pattern) }
    false
  end

  def numerical_pattern?
    pattern = @passphrase.split('').map(&:to_i)
    pattern.each_with_index do |num, index|
      return true if pattern[index + 1] == num + 1 && pattern[index + 2] == num + 2 && pattern[index + 3] == num + 3
      return true if pattern[index + 1] == num - 1 && pattern[index + 2] == num - 2 && pattern[index + 3] == num - 3
    end
    false
  end

  def repetitious?
    characters = @passphrase.split('')
    characters.each_with_index do |character, index|
      return true if characters[index + 1] == character && characters[index + 2] == character
    end
    false
  end

  def common?
    @passphrases = []
    @passphrases << @passphrase
    if @passphrase.match(/[@0|1$5]/)
      @passphrases << @passphrase.gsub('@', 'a').gsub('0', 'o').gsub(/[|1!]/, 'l').gsub(/[$5]/, 's')
      @passphrases << @passphrase.gsub('@', 'a').gsub('0', 'o').gsub(/[|1!]/, 'i').gsub(/[$5]/, 's')
    end
    COMMON_PASSPHRASES.each do |commoner|
      @passphrases.each { |passphrase| return true if passphrase.downcase.include?(commoner.downcase) }
    end
    false
  end

  def uniqueness
    (@passphrase.downcase.split('').uniq.length/length.to_f) < 0.4
  end

  def repeaters
    mode = []
    @passphrase.downcase.split('').uniq.each do |character|
      mode << @passphrase.split('').count(character)
    end
    mode.max.downto(2) do |num|
      return true if (mode.count(num)/mode.length.to_f) > 0.75
    end
    false
  end

  def bad_passphrase_multiplier
    repeaters || uniqueness ? (return 0.1) : 1
    key_pattern? || numerical_pattern? || repetitious? || common? ? @passphrase.length < 12 ? 0.5 : 0.75 : 1
  end
end