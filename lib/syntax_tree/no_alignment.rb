# frozen_string_literal: true
require_relative "no_alignment/version"

module SyntaxTree
  module NoAlignment
    module CommandPatch
      def align(q, node, &block)
        q.text(" ")

        if node.arguments.is_a?(Args) && node.arguments.parts.size == 1 &&
             skip_indent?(arguments.parts.first)
          block.call
          return
        end

        q.indent(&block)
      end

      def skip_indent?(argument)
        (argument.is_a?(BareAssocHash) && argument.assocs.size == 1) ||
          argument.is_a?(CallNode) || AssignFormatting.skip_indent?(argument)
      end
    end

    module CommandCallPatch
      def argument_alignment(_q, _doc)
        %w[to not_to to_not].include?(message.value) ? 0 : 2
      end
    end
  end
end

SyntaxTree::Command.prepend(SyntaxTree::NoAlignment::CommandPatch)
SyntaxTree::CommandCall.prepend(SyntaxTree::NoAlignment::CommandCallPatch)
