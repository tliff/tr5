require "spec"

describe Vector4 do

  describe "#initialize" do
    it "creates a point" do
      v = Vector4.new(4.3, -4.2, 3.1, 1.0)
      v.x.should eq 4.3
      v.y.should eq -4.2
      v.z.should eq 3.1
      v.point?.should  eq true
      v.vector?.should eq false
    end
    
    it "creates a vector" do
      v = Vector4.new(4.3, -4.2, 3.1, 0.0)
      v.x.should eq 4.3
      v.y.should eq -4.2
      v.z.should eq 3.1
      v.point?.should  eq false
      v.vector?.should eq true
    end
  end
  
  describe "#point" do
    it "creates a point tuple" do
      v = Vector4.point(4.0, -4.0, 3.0)
      v.should eq Vector4.new(4.0, -4.0, 3.0, 1.0)
    end
  end
  describe "#vector" do
    it "creates a vectpr tuple" do
      v = Vector4.vector(4.0, -4.0, 3.0)
      v.should eq Vector4.new(4.0, -4.0, 3.0, 0.0)
    end
  end
  
  describe "#+" do
    it "should add two tuples" do
      v1 = Vector4.new(3, -2, 5, 1)
      v2 = Vector4.new(-2, 3, 1, 0)
      (v1+v2).should eq Vector4.new(1, 1, 6, 1)
    end
  end
  
  describe "#-" do
    it "should substract a point from a point" do
      p1 = Vector4.point(3,2,1)
      p2 = Vector4.point(5,6,7)
      v = p1 - p2
      v.should eq Vector4.vector(-2, -4, -6)
    end
    it "should substrace a vector from a point" do
      p1 = Vector4.point(3,2,1)
      p2 = Vector4.vector(5,6,7)
      v = p1 - p2
      v.should eq Vector4.point(-2, -4, -6)
    end
    it "should subtract a vector from a vector" do
      p1 = Vector4.vector(3,2,1)
      p2 = Vector4.vector(5,6,7)
      v = p1 - p2
      v.should eq Vector4.vector(-2, -4, -6)
    end
    it "should negate itself" do
      v = Vector4.zero - Vector4.vector(1,-2,3)
      v.should eq Vector4.vector(-1,2,-3)
    end
    it "should negate a tuple" do
      (-Vector4.new(1,-2,3,-4)).should eq Vector4.new(-1,2,-3,4)
    end
  end
  
  describe "#*" do
    it "should multiply by a scalar" do
      (Vector4.new(1,-2,3,-4)*3.5).should eq Vector4.new(3.5,-7,10.5,-14)
    end
    it "should multiply by a fraction" do
      (Vector4.new(1,-2,3,-4)*0.5).should eq Vector4.new(0.5,-1,1.5,-2)
    end
  end
  
  describe "/#" do
    it "should divide by a scalar" do
      (Vector4.new(1,-2,3,-4)/2).should eq Vector4.new(0.5,-1,1.5,-2)
    end
  end
  
  describe "#length" do
    it "should calculate the magnitude" do
      Vector4.vector(1,0,0).length.should eq 1
      Vector4.vector(0,1,0).length.should eq 1
      Vector4.vector(0,0,1).length.should eq 1
      Vector4.vector(1,2,3).length.should eq Math.sqrt(14)
      Vector4.vector(-1,-2,-3).length.should eq Math.sqrt(14)
    end
  end

  describe "#norm" do
    it "should calculate the norm" do
      Vector4.vector(4,0,0).norm.should eq Vector4.vector(1,0,0)
    end
    it "should calculate the norm" do
      Vector4.vector(1,2,3).norm.should eq Vector4.vector(1.0/Math.sqrt(14),2.0/Math.sqrt(14),3.0/Math.sqrt(14))
    end
    it "should calculate the magnitude of a normal" do
      Vector4.vector(1,2,3).norm.length.should eq 1
    end
  end
  
  describe "#*" do
    it "should calculate the dot product" do 
      v1 = Vector4.vector(1,2,3)
      v2 = Vector4.vector(2,3,4)
      (v1*v2).should eq 20
    end
  end
  
  describe "#%" do
    it "should calculate the cross product" do
      v1 = Vector4.vector(1,2,3)
      v2 = Vector4.vector(2,3,4)
      (v1%v2).should eq Vector4.vector(-1,2,-1)
      (v2%v1).should eq Vector4.vector(1,-2,1)
      
    end
  end
  
end