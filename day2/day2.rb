# frozen_string_literal: true

file_data = File.readlines('day2/real_input.txt')

safe_reports = 0
unsafe_lines = []

file_data.each_with_index do |report, line_index|
  report_split = report.split(' ')
  order = report_split[0].to_i < report_split[1].to_i ? :asc : :desc
  safe = true

  # puts "Start order #{order}"

  report_split.each_with_index do |level, index|
    next if index.zero?

    case order
    when :asc
      safe = false if level.to_i < report_split[index - 1].to_i
    when :desc
      safe = false if level.to_i > report_split[index - 1].to_i
    end

    safe = false if (level.to_i - report_split[index - 1].to_i).abs < 1
    safe = false if (level.to_i - report_split[index - 1].to_i).abs > 3

    # puts "Compare #{level} to #{report_split[index - 1]} -> #{safe ? 'Safe' : 'Unsafe'}"
  end

  # puts "Line #{report_split.join(',')} is #{safe ? 'Safe' : 'Unsafe'}"

  safe_reports = safe_reports + 1 if safe
  unsafe_lines << line_index unless safe
end

puts "Total P1: #{safe_reports}"

file_data.each_with_index do |report, index|
  next unless unsafe_lines.include?(index)

  report_split = report.split(' ')

  report_split.length.times do |variant|
    new_report = report_split.reject.with_index{ |v, i| i == variant }

    order = new_report[0].to_i < new_report[1].to_i ? :asc : :desc
    safe = true

    new_report.each_with_index do |level, index|
      next if index.zero?

      case order
      when :asc
        safe = false if level.to_i < new_report[index - 1].to_i
      when :desc
        safe = false if level.to_i > new_report[index - 1].to_i
      end

      safe = false if (level.to_i - new_report[index - 1].to_i).abs < 1
      safe = false if (level.to_i - new_report[index - 1].to_i).abs > 3
    end

    # puts "Line #{new_report.join(',')} is #{safe ? 'Safe' : 'Unsafe'}"

    safe_reports += 1 if safe
    break if safe
  end
end

puts "Total P2: #{safe_reports}"
