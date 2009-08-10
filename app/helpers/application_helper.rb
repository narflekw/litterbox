# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def flash_for symbol
    # <div id="flash_error" class="message-block error">
    #   text
    # </div>
      content_tag( :div, flash[symbol].to_s, :id => "flash_#{symbol}", :class => "message-block #{symbol}",
                   :style => flash[symbol] ? nil : 'display: none' )
  end

end
