module TodosHelper
  def priority_label(priority)
    case priority
    when 1 then "低"
    when 2 then "中"
    when 3 then "高"
    else "未設定"
    end
  end
end
