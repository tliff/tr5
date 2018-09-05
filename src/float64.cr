struct Float64
  
  def =~(other)
    (self - other).abs < 0.0000000001
  end
  
end