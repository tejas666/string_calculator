class StringCalculator
  def self.add(numbers)
    if numbers.empty?
      0
    else
      delimiter = ','
      if numbers.start_with?("//")
        delimiter = numbers[2]
        numbers = numbers[(numbers.index("\n") + 1)..-1]
      end

      negatives = numbers.scan(/-\d+/)
      if negatives.any?
        raise "Negative numbers not allowed: #{negatives.join(', ')}"
      end

      numbers.split(/[#{delimiter}\n]/).map(&:to_i).inject(:+)
    end
  end
end
