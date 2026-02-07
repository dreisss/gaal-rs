alias TMatrix = Array(Array(Int32))

class Matrix
  property data : TMatrix
  getter rows : Int32
  getter columns : Int32

  def validate(data : TMatrix)
    data.each do |row|
      raise "A quantidade de elementos de cada linha deve ser igual!" if row.size != @columns
    end
  end

  def initialize(data : TMatrix)
    @data = data
    @rows = data.size
    @columns = data.first.size

    validate(data)
  end

  def to_s(io)
    cell_size = 0

    @data.each do |row|
      row.each do |cell|
        cell_size = cell.to_s.size > cell_size ? cell.to_s.size : cell_size
      end
    end

    output = (@data.map do |row|
      "\t" + (row.map do |cell|
        cell.to_s.ljust(cell_size, ' ')
      end).join('\t') + "\t"
    end).join('\n')

    size = output.split("\n").first.size

    io << "┌ #{' ' * 2} ┐\n" + output + "\n└ ┘"
  end

  def data=(data)
    validate(data)

    @data = data
  end

  def +(other : Matrix)
    raise "Dimensões incompatíveis" if @rows != other.rows || @columns != other.columns

    new_data = @data.map_with_index do |row, i|
      row.map_with_index do |cell, j|
        cell + other.data[i][j]
      end
    end

    Matrix.new(new_data)
  end

  def *(other : Matrix)
    self + other
  end

  def ^(other : Symbol | Int32)
    if other == :T
      return
    end

    # return multiply
  end
end

a = Matrix.new([
  [1, 2, 313],
  [1, 2, 313],
])

b = Matrix.new([
  [1, 2, 3],
  [1, 2, 3],
])

puts a + b

puts a ^ :T
puts a ^ 2
