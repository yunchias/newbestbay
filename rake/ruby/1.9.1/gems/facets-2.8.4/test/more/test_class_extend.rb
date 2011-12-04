# Test facets/class_extension.rb.

require 'facets/class_extend'
require 'test/unit'

class TC_ClassExtension < Test::Unit::TestCase

  # fixture

  module N
    def instance_method; end

    class_extend do
      def n ; 43 ; end
      def s ; self ; end
    end
    #extend class_extend # NOTE: No longer needed!
  end

  class X
    include N
    def n ; 11 ; end
  end

  module K
    include N
    class_extend do
      def n ; super + 1 ; end
    end
  end

  class Z
    include K
  end

  # tests

  def test_01
    assert_equal( 43, N.n )
    assert_equal(  N, N.s )
  end
  def test_02
    assert_equal( 43, X.n )
    assert_equal(  X, X.s )
  end
  def test_03
    assert_equal( 11, X.new.n )
  end
  def test_04
    assert_equal( 44, K.n )  # notice the difference!
    assert_equal(  K, K.s )
  end
  def test_05
    assert_equal( 44, Z.n )
    assert_equal(  Z, Z.s )
  end
  def test_06
    assert_equal( ['instance_method'], N.instance_methods.map{ |m| m.to_s } )
    result = (N.methods - N.instance_methods - Object.instance_methods - Module.methods).map{ |m| m.to_s }.sort
    assert_equal( ['append_features', 'n', 's'], result)
  end

end

