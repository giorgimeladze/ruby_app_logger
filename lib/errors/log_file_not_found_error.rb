class LogFileNotFoundError < StandardError
  def message
    'Correct Log File Name not provided'
  end
end