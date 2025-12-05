
content = File.read('2.txt')

pairs = content.scan(/\d+-\d+/).map { |pair| pair.split('-').map(&:to_i) }

count = 0
pairs.each do |a, b|
  while a <= b
    string = a.to_s
    i= string.length
    while (i>1)
      if string.length % i == 0
        part_length = string.length / i
        parts = string.chars.each_slice(part_length).map(&:join)
        if parts.uniq.length == 1 && parts.length >= 2
          count += a
          break
        end
      end
      i -= 1
    end
    a += 1
  end
end
puts "Total count: #{count}"

