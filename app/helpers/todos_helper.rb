module TodosHelper
  def priority_label(priority)
    case priority
    when 1 then "低"
    when 2 then "中"
    when 3 then "高"
    else "未設定"
    end
  end

  def status_label(status)
    case status
    when "wait" then "未着手"
    when "doing" then "着手中"
    when "done" then "完了"
    else "不明"
    end
  end
end
