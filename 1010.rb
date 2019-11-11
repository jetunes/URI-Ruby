a = gets.chomp.split.map(&:to_f)
b = gets.chomp.split.map(&:to_f)

total = (a[1]*a[2])+(b[1]*b[2])

puts 'VALOR A PAGAR: R$ %.2f' % total