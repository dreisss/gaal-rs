require "./spec_helper"

describe Gaal do
  describe Matrix do
    line_matrix = Matrix.new([
      [0, 1, 2],
    ])

    column_matrix = Matrix.new([
      [0],
      [1],
      [2],
    ])

    it "View line matrix" do
      line_matrix.to_s.should eq "┌             ┐\n   0   1   2   \n└             ┘\n"
      # ┌             ┐
      #    0   1   2
      # └             ┘
    end

    it "View column matrix" do
      column_matrix.to_s.should eq "┌     ┐\n   0   \n   1   \n   2   \n└     ┘\n"
      # ┌     ┐
      #    0
      #    1
      #    2
      # └     ┘
    end

    it "Matrix equality" do
      (line_matrix == Matrix.new([[0, 1, 2]])).should be_true
      (column_matrix == Matrix.new([[0], [1], [2]])).should be_true
    end
  end
end
