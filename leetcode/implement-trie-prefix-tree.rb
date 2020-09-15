# This implemention is based on a Ternary Search Tree.
class Trie
  attr_reader :root

  def initialize
    @root = nil
  end

  class Node
    attr_accessor :left, :mid, :right, :char, :end

    def initialize(char)
      @char = char
      @left = @mid = @right = nil
      @end = false
    end

    def last?
      @end == true
    end
  end

  def insert(key)
    key = key.to_s
    return nil if key.empty?
    @root = push_recursive(@root, key, 0)
    nil
  end

  def search(key)
    key = key.to_s
    return false if key.empty?
    !(get_recursive(@root, key, 0).nil?)
  end

  def starts_with(prefix)
    prefix = prefix.to_s
    return nil if prefix.empty?
    node = starts_with_recursive(@root, prefix, 0)
    node ? true : false
  end

  def push_recursive(node, string, index)
    char = string[index]
    node = Node.new(char) if node.nil?
    if char < node.char
      node.left = push_recursive(node.left, string, index)
    elsif char > node.char
      node.right = push_recursive(node.right, string, index)
    elsif index < string.length - 1 # We're not at the end of the input string; add next char
      node.mid = push_recursive(node.mid, string, index + 1)
    else
      node.end = true
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

# trie = Trie.new()
# puts trie.insert("hello")
# puts trie.search("hell")   # returns false
# puts trie.search("helloa")     # returns false
# puts trie.search("hello")     # returns true
# puts trie.starts_with("hell") # returns true
# puts trie.starts_with("helloa") # returns false
# puts trie.starts_with("hello") # returns true


