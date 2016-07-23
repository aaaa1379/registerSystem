module ApplicationHelper
  def mtr_toast(content)
    "Materialize.toast('<span>#{content}</span>', 5000);"
  end
  
  def color_number(number)
    if number.to_f < 0 
      return "<span class='red-text'> #{number} </span>".html_safe 
    end
    if number.to_f == 0
      return "<span> - </span>".html_safe
    end
    if number.to_f > 0
      return "<span> #{number} </span>".html_safe
    end
  end
  def color_coop(text, coop)
    if coop
      return "<span class='blue-text'> #{text} </span>".html_safe
    else
      return "<span class='green-text'> #{text} </span>".html_safe
    end
  end
  def color_status(status)
    return "<span class='blue-text'> 未完成 </span>".html_safe if status.in? ['waiting']
    return "<span class='red-text'> 邀請中 </span>".html_safe  if status.in? ['inviting']
    return "<span> 完成 </span>".html_safe                     if status.in? ['completed']
  end

  def to_number(vacancy)
    return JSON.parse(vacancy.number)
  end
  def to_used(vacancy)
    return JSON.parse(vacancy.used)
  end
  def to_remain(vacancy)
    number_list = to_number(vacancy)
    used_list   = to_used(vacancy)
    remain_list = Hash.new

    number_list.each do |key, value|
      remain_list[key] = value.to_f - used_list[key].to_f
    end

    return remain_list
  end

end