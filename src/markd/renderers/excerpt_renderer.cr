module Markd
  class ExcerptRenderer < HTMLRenderer
    @paragraph_count = 0
    @visible = false

    def heading(node : Node, entering : Bool)
    end

    def code_block(node : Node, entering : Bool)
    end

    def thematic_break(node : Node, entering : Bool)
    end

    def block_quote(node : Node, entering : Bool)
    end

    def list(node : Node, entering : Bool)
    end

    def image(node : Node, entering : Bool)
    end

    def html_block(node : Node, entering : Bool)
    end

    def emphasis(node : Node, entering : Bool)
      super if @visible
    end

    def strong(node : Node, entering : Bool)
      super if @visible
    end

    def code(node : Node, entering : Bool)
      super if @visible
    end

    def paragraph(node : Node, entering : Bool)
      if @paragraph_count == 0
        @visible = entering
      end
      @paragraph_count += 1 unless entering
    end

    def text(node : Node, entering : Bool)
      super if @visible
    end
  end
end
