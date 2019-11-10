def swapping(list, count_swaps)
  return count_swaps if list.size <= 1
  swap_flag = true
  while swap_flag do
    swap_flag = false
    (list.size-1).times do |aux|
      if list[aux] > list[aux+1]
        list[aux], list[aux+1] = list[aux+1], list[aux]
        count_swaps +=1
        swap_flag = true
      end
    end    
  end

  return count_swaps
end

gets.chomp.to_i.times do |cases|
	large = gets.chomp.to_i
	list = gets.chomp.split.map(&:to_i)
	p "Optimal train swapping takes #{swapping(list[0..large-1], 0)} swaps."
end