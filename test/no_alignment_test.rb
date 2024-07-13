# frozen_string_literal: true

require "test_helper"

require "syntax_tree"
require "syntax_tree/no_alignment"

class NoAlignmentTest < Minitest::Test
  def test_command_with_multiple_arguments
    assert_equal <<~GOOD, SyntaxTree.format(<<~BAD, 40)
      some_command argument_one,
        argument_two,
        argument_three,
        argument_four,
        argument_five
    GOOD
      some_command argument_one,
                   argument_two,
                   argument_three,
                   argument_four,
                   argument_five
    BAD
  end

  def test_command_with_single_call_node_argument
    assert_equal <<~GOOD, SyntaxTree.format(<<~BAD, 40)
      raise SomeLongError.new(
        "message",
        {
          extra: "metadata",
          more: "metadata"
        }
      )
    GOOD
      raise SomeLongError.new(
              "message",
              {
                extra: "metadata",
                more: "metadata"
              }
            )
    BAD
  end

  def test_command_with_single_keyword_argument
    assert_equal <<~GOOD, SyntaxTree.format(<<~BAD, 40)
      render json: {
        foo: "one",
        bar: "two",
        baz: "three"
      }
    GOOD
      render json: {
               foo: "one",
               bar: "two",
               baz: "three"
             }
    BAD
  end

  def test_command_call_with_multiple_arguments
    assert_equal <<~GOOD, SyntaxTree.format(<<~BAD, 40)
      some_object.some_command argument_one,
        argument_two,
        argument_three,
        argument_four
    GOOD
      some_object.some_command argument_one,
                               argument_two,
                               argument_three,
                               argument_four
    BAD
  end
end
