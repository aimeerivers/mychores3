Then /^there should be a task called "([^\"]*)" due on (\d+\-\d+\-\d+)$/ do |task_name, due_on_date|
  Task.find_by_name(task_name).due_on.should == Date.parse(due_on_date)
end

