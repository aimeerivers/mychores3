When /^(?:|I )select "([^\"]*)" as the "([^\"]*)" date$/ do |date, date_label|
  select_date(date, :from => date_label)
end

DATE_TIME_SUFFIXES = {
  :year   => '1i',
  :month  => '2i',
  :day    => '3i',
  :hour   => '4i',
  :minute => '5i'
}

def select_date(date_to_select, options ={})
  date = date_to_select.is_a?(Date) || date_to_select.is_a?(Time) ?
            date_to_select : Date.parse(date_to_select)

  id_prefix = id_prefix_for(options)

  select date.year, :from => "#{id_prefix}_#{DATE_TIME_SUFFIXES[:year]}"
  select date.strftime('%B'), :from => "#{id_prefix}_#{DATE_TIME_SUFFIXES[:month]}"
  select date.day, :from => "#{id_prefix}_#{DATE_TIME_SUFFIXES[:day]}"
end

def id_prefix_for(options = {})
  msg = "cannot select option, no select box with id, name, or label '#{options[:from]}' found"
  locate(:xpath, Capybara::XPath.select(options[:from]), msg)['id'].gsub(/_#{DATE_TIME_SUFFIXES[:year]}$/,'')
end
