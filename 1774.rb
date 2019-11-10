def ciclo(vertice)
  @arvore_minima.each { |x| x[:visitado] = false }
  procura_ciclo(vertice[:origem], vertice[:destino], @arvore_minima.dup)
end

def procura_ciclo(primeiro, segundo, vertices)
  vertices_adjacentes = vertices.select { |vertice| vertice[:origem] == primeiro || vertice[:destino] == primeiro}  
  return false if vertices_adjacentes.empty?

  vertices_adjacentes.reject {|vertice| vertice[:visitado] }.each do |vert|
    vert[:visitado] = true
    proximo_ponto = (vert[:origem] == primeiro) ? vert[:destino] : vert[:origem]
    return true if proximo_ponto == segundo || procura_ciclo(proximo_ponto, segundo, vertices)
  end
  false
end

input = gets.chomp.split.map(&:to_i)
if (input[0] >= 3) and (input[0] <= 60) and (input[1] >= input[0]) and (input[1] <= 200)
	vetor = Array.new
	input[1].times do |pegar_vertices|
		vetor << gets.chomp.split.map(&:to_i)
	end
end

@arvore_minima = []  
vetor.map {|primeiro, segundo, peso| { :origem => primeiro, :destino => segundo, :peso => peso}}.sort_by { |x| x[:peso]}.each do |vertice|
  @arvore_minima << vertice unless ciclo(vertice)
end

p @arvore_minima.inject(0) { |count, vertice| count + vertice[:peso]}
