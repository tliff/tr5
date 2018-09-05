class Vector4
  getter x : Float64 = 0.0
  getter y : Float64 = 0.0
  getter z : Float64 = 0.0
  getter w : Float64 = 0.0

  def initialize(@x : Float64, @y : Float64, @z : Float64, @w : Float64)
  end

  def self.point(x : Float64, y : Float64, z : Float64)
    self.new(x, y, z, 1.0)
  end

  def self.vector(x : Float64, y : Float64, z : Float64)
    self.new(x, y, z, 0.0)
  end

  def self.zero
    self.new(0, 0, 0, 0)
  end

  def point?
    @w == 1.0
  end

  def vector?
    @w == 0.0
  end

  def ==(other)
    other.x =~ x &&
      other.y =~ y &&
      other.z =~ z &&
      other.w =~ w
  end

  def +(other)
    self.class.new(x + other.x,
      y + other.y,
      z + other.z,
      w + other.w)
  end

  def -(other)
    self.class.new(x - other.x,
      y - other.y,
      z - other.z,
      w - other.w)
  end

  def -
    Vector4.zero - self
  end

  def *(other : Float64)
    self.class.new(x*other,
      y*other,
      z*other,
      w*other)
  end

  def *(other : Vector4)
    x*other.x + y*other.y + z*other.z
  end

  def /(other)
    self * (1.0/other)
  end

  def %(other)
    self.class.vector(
      y*other.z - z * other.y,
      z*other.x - x * other.z,
      x*other.y - y * other.x,
    )
  end

  def length
    Math.sqrt(x**2 + y**2 + z**2 + w**2)
  end

  def norm
    self / length
  end
end
