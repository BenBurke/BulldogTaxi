module ApplicationHelper

def displayPhoneNumber(input)
    input = input.to_s
    if input.gsub(/\D/, "").match(/^1?(\d{3})(\d{3})(\d{4})/)
      areaCode = "(" + $1.to_s + ") "
      result = areaCode + [$2, $3].join("-")
      return result
    end
end

end
