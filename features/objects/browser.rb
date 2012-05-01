class BrowserContainer
  attr_reader :browser

  def initialize(browser)
    @browser = browser	
  end

  class << self
    attr_accessor :title
  end

  # Here you place all browser-specific methods
  def close
    @browser.close
  end

  def contain? text
	Watir::Wait.until { @browser.text.include? text }
  end

  def loaded? title
    Watir::Wait.until { @browser.title == title }
  end

  def load_status
	@browser.ready_state
  end
end

