CAPTURE_CASH_AMOUNT = Transform(/^\$(\d+)$/) do |digit|
    digit.to_i
end
