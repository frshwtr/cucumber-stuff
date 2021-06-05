Given /^I have credited (#{CAPTURE_CASH_AMOUNT}) in my account$/ do |amount|
  my_account.credit(amount)
end
  
When /^I withdraw (#{CAPTURE_CASH_AMOUNT})$/ do |amount|
  teller.withdraw_from(my_account, amount)
end

Then /^(#{CAPTURE_CASH_AMOUNT}) should be deposited$/ do |amount|
  expect(cash_slot.contents).to eq(amount)
end

Then /^the balance of my account should be (#{CAPTURE_CASH_AMOUNT})$/ do |amount|
  sleep 1
  eventually {expect(my_account.reload.balance).to eq(amount),
  "Expected balance to be #{amount}, but received #{my_account.balance}"}
end
