# https://leetcode.com/problems/design-browser-history/
# 实现：2 个 stack: 1 个代表 @back_history 1 个代表 @forward_history

require_relative '../lib/algorithms'

class BrowserHistory
  include Containers

=begin
    :type homepage: String
=end
  def initialize(homepage)
    @back_history = Stack.new()
    @forward_history = Stack.new()
    @homepage = homepage
    @current = homepage
  end

=begin
    :type url: String
    :rtype: Void
=end
  def visit(url)
    @forward_history.clear
    @back_history.push(url)
    @current = url
  end

=begin
    :type steps: Integer
    :rtype: String
=end
  def back(steps)
    steps.times do
      break if @back_history.empty?
      url = @back_history.pop
      @forward_history.push(url)
    end
    @current = if @back_history.tail
                 @back_history.tail.obj
               else
                 @homepage
               end
  end

=begin
    :type steps: Integer
    :rtype: String
=end
  def forward(steps)
    steps.times do
      return @current if @forward_history.empty?
      @current = @forward_history.pop
      @back_history.push(@current)
    end
    @current
  end

  def to_s
    {
        back_history: @back_history.to_s,
        forward_history: @forward_history.to_s
    }.to_s
  end
end

# Your BrowserHistory object will be instantiated and called as such:
browserHistory = BrowserHistory.new("leetcode.com")
puts browserHistory
puts browserHistory.visit("google.com")    # You are in "leetcode.com". Visit "google.com"
puts browserHistory

puts browserHistory.visit("facebook.com")    # You are in "google.com". Visit "facebook.com"
puts browserHistory

puts browserHistory.visit("youtube.com")    # You are in "facebook.com". Visit "youtube.com"
puts browserHistory

puts browserHistory.back(1)    # You are in "youtube.com", move back to "facebook.com" return "facebook.com"
puts browserHistory

puts browserHistory.back(1)    # You are in "facebook.com", move back to "google.com" return "google.com"
puts browserHistory

puts browserHistory.forward(1)    # You are in "google.com", move forward to "facebook.com" return "facebook.com"
puts browserHistory

puts browserHistory.visit("linkedin.com")    # You are in "facebook.com". Visit "linkedin.com"
puts browserHistory

puts browserHistory.forward(2)    # You are in "linkedin.com", you cannot move forward any steps.
puts browserHistory

puts browserHistory.back(2)    # You are in "linkedin.com", move back two steps to "facebook.com" then to "google.com". return "google.com"
puts browserHistory

puts browserHistory.back(7)    # You are in "google.com", you can move back only one step to "leetcode.com". return "leetcode.com"
puts browserHistory


