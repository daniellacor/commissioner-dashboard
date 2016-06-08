module DraftHelper
  def calendar(date = Date.today, &block)
    Draft.new(self, date, block).table
  end
end
