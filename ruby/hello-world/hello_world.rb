class HelloWorld
  def self.hello(*args)
    name = args[0]
    name ? "Hello, #{name}!" : "Hello, World!"    
  end
end