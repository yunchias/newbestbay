require 'facets/string/indent'
require 'test/unit'

class TC_String_Indent < Test::Unit::TestCase

  def test_positive_indent
    assert_equal '    xyz', "xyz".  indent(4)
    assert_equal '    xyz', "  xyz".indent(2)
  end

  def test_multi_line_positive_indent
    assert_equal  "  abc\n" +
                  "  xyz"   , 
                 ("abc\n"   +
                  "xyz"     ).indent(2)
  end

  def test_0_indent
    assert_equal 'xyz', 'xyz'.indent(0)
  end

  def test_negative_indent
    assert_equal '  xyz', '    xyz'.indent(-2)
    assert_equal 'xyz',   '  xyz'.  indent(-2)
  end

  def test_multi_line_negative_indent
    assert_equal  "  abc\n" +
                  "  xyz"   , 
                 ("    abc\n"   +
                  "    xyz"     ).indent(-2)
  end

  def test_outdent_is_alias_for_negative_indent
    assert_equal 'xyz', '  xyz'.outdent(2)
  end

  def test_negative_indent_more_than_is_possible
    assert_equal 'xyz', '  xyz'.indent(-3)
  end

  #-----------------------------------
  # Using a character other than space

  def test_nonspace_positive__indent
    assert_equal '----xyz', "xyz".indent(4, '-')
  end

  def test_nonspace_0_indent
    assert_equal 'xyz', 'xyz'.indent(0, '-')
  end

  def test_nonspace_negative_indent_nonmatching_character
    assert_equal '    xyz', '    xyz'.indent(-2, '-')
    assert_equal '  xyz',   '  xyz'.  indent(-2, '-')
  end

  def test_nonspace_negative_indent
    assert_equal '--xyz', '----xyz'.indent(-2, '-')
    assert_equal 'xyz',   '--xyz'.indent(-2, '-')
  end

  def test_special_regexp_characters_are_escaped
    # make sure . is treated as a literal '.' and not an "any character" wildcard
    assert_equal '  xyz', '  xyz'.indent(-2, '.')
    assert_equal 'xyz',   '..xyz'.indent(-2, '.')

    assert_equal '  xyz', '  xyz'.indent(-2, '^')
    assert_equal 'xyz',   '^^xyz'.indent(-2, '^')

    assert_equal '  xyz', '  xyz'.indent(-2, '*')
    assert_equal 'xyz',   '**xyz'.indent(-2, '*')
  end
end

