module WorksHelper

  def draw_work_until_version(reference_piece)
    pieces = @work.pieces.collect { |piece| piece.updated_before(reference_piece.updated_at) }
    
    #if pieces.detect { |piece| (piece ? (piece.text and piece.text.length > 2) : nil) }
      "<table class='work_state'>" +
      pieces.inject("") do |output, piece|
        if piece
          output += "<tr><td class='#{'updated' if piece == reference_piece}'>#{piece.text}&nbsp;</td></tr>"
        end
        output
      end + "</table>"
    #end
  end

end
