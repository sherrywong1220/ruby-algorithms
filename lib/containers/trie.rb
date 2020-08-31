# This implemention is based on a Ternary Search Tree.
module Containers
  class Trie
    attr_reader :root

    def initialize
      @root = nil
    end

    class Node
      attr_accessor :left, :mid, :right, :char, :value, :end

      def initialize(char, value)
        @char = char
        @value = value
        @left = @mid = @right = nil
        @end = false
      end

      def last?
        @end == true
      end
    end

    def push(key, value)
      key = key.to_s
      return nil if key.empty?
      @root = push_recursive(@root, key, 0, value)
      value
    end
    alias :[]= :push

    def has_key?(key)
      key = key.to_s
      return false if key.empty?
      !(get_recursive(@root, key, 0).nil?)
    end

    def get(key)
      key = key.to_s
      return nil if key.empty?
      node = get_recursive(@root, key, 0)
      node ? node.value : nil
    end
    alias :[] :get

    def starts_with(prefix)
      prefix = prefix.to_s
      return nil if prefix.empty?
      node = starts_with_recursive(@root, prefix, 0)
      node ? true : false
    end

    # Returns the longest key that has a prefix in common with the parameter string. If
    # no match is found, the blank string "" is returned.
    #
    # Complexity: O(m) worst case
    #
    #   t = Containers::Trie.new
    #   t.push("Hello", "World")
    #   t.push("Hello, brother", "World")
    #   t.push("Hello, bob", "World")
    #   t.longest_prefix("Hello, brandon") #=> "Hello"
    #   t.longest_prefix("Hel") #=> ""
    #   t.longest_prefix("Hello") #=> "Hello"
    def longest_prefix(string)
      string = string.to_s
      return nil if string.empty?
      len = prefix_recursive(@root, string, 0)
      string[0...len]
    end

    # Returns a sorted array containing strings that match the parameter string. The wildcard
    # characters that match any character are '*' and '.' If no match is found, an empty
    # array is returned.
    #
    # Complexity: O(n) worst case
    #
    #   t = Containers::Trie.new
    #   t.push("Hello", "World")
    #   t.push("Hilly", "World")
    #   t.push("Hello, bob", "World")
    #   t.wildcard("H*ll.") #=> ["Hello", "Hilly"]
    #   t.wildcard("Hel") #=> []
    def wildcard(string)
      string = string.to_s
      return nil if string.empty?
      ary = wildcard_recursive(@root, string, 0, '')
      ary.flatten.compact.sort
    end

    def push_recursive(node, string, index, value)
      char = string[index]
      node = Node.new(char, value) if node.nil?
      if char < node.char
        node.left = push_recursive(node.left, string, index, value)
      elsif char > node.char
        node.right = push_recursive(node.right, string, index, value)
      elsif index < string.length - 1 # We're not at the end of the input string; add next char
        node.mid = push_recursive(node.mid, string, index + 1, value)
      else
        node.end = true
        node.value = value
      end
      node
    end
    private :push_recursive

    # Returns node if found
    def get_recursive(node, string, index)
      return nil if node.nil?
      char = string[index]
      if char < node.char
        return get_recursive(node.left, string, index)
      elsif char > node.char
        return get_recursive(node.right, string, index)
      elsif index < string.length - 1
        return get_recursive(node.mid, string, index + 1)
      else
        return node.last? ? node : nil
      end
    end
    private :get_recursive

    def prefix_recursive(node, string, index)
      return 0 if node.nil? || index == string.length - 1

      len = 0
      char = string[index]
      if char < node.char
        len += prefix_recursive(node.left, string, index)
      elsif char > node.char
        len += prefix_recursive(node.right, string, index)
      else
        len += 1
        len += prefix_recursive(node.mid, string, index + 1)
      end
      len
    end
    private :prefix_recursive

    def wildcard_recursive(node, string, index, prefix)
      return nil if node.nil? || index == string.length
      arr = []
      char = string[index]
      if char == '*' || char == '.' || char < node.char
        arr << wildcard_recursive(node.left, string, index, prefix)
      end
      if char == '*' || char == '.' || char > node.char
        arr << wildcard_recursive(node.right, string, index, prefix)
      end
      if char == '*' || char == '.' || char == node.char
        if index == string.length - 1 && node.last?
          arr << "#{prefix}#{node.char}"
        end
        arr << wildcard_recursive(node.mid, string, index + 1, prefix + node.char)
      end
      arr
    end
    private :wildcard_recursive

    def starts_with_recursive(node, string, index)
      return if node.nil?

      char = string[index]
      if char < node.char
        starts_with_recursive(node.left, string, index)
      elsif char > node.char
        starts_with_recursive(node.right, string, index)
      elsif index == string.length - 1
        node
      else
        starts_with_recursive(node.mid, string, index + 1)
      end
    end
    private :starts_with_recursive
  end
end

# t = Containers::Trie.new
# puts t.push('hello', 'world')
# puts t.push('hello,', 'worldxx')
#
# puts t.longest_prefix("hello, xxx")
# t.push("Hello", "World")
# t.push("Hilly", "World")
# puts t.wildcard("H*ll.")
# puts t.wildcard("Hel")
# puts t.starts_with('hel')
# puts t.has_key?('hel')
# t['hel'] = 'a'
# puts t.has_key?('hel')
