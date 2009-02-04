# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def msg_box(txt=nil)
    txt ||= flash[:notice]
    html = ""
    unless txt.blank?
      if txt.split("error_on=")[1]
        txt = error_messages_for txt.split("error_on=")[1].to_sym
      end
      unless txt.blank?
        html = "<div id='errors'><div id=\"flash\" class=\"msg #{flash[:success] == false ? 'error' : 'success'}\"><p>#{flash[:notice]}</p></div></div>"
      end
    end
    flash[:notice] = nil    
    html
  end
  
  def obj_error_msg_box(object)
    if object.errors.any?      
      error_messages =  object.errors.full_messages.sort{|x,y| x <=> y}.map {|msg| content_tag(:li, msg) } 
      contents  = '<div class="msg error">'
      contents << content_tag(:h2, 'Please correct the following fields:')      
      contents << content_tag(:ul, error_messages)
      contents << "</div>"
      contents
    end
  end
  
  def paginate(objects)
    if objects.total_pages > 1
      html = "<div class=\"apple_pagination\" style=\"float:right\">"
      html += will_paginate objects, :container => false 
      html += "</div><br style=\"clear:both\""    
    end
  end

  def currency_label(amount)
    number_to_currency(amount) || 'NA'
  end
  
end
