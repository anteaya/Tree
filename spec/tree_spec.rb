require File.join(File.dirname(__FILE__), 'spec_helper')

describe Tree do
  context "#new" do
    it "takes a node and returns a tree" do
      node = Node.new("armchair")
      tree = Tree.new(node)
      tree.should be_an_instance_of(Tree)
    end
  end
    
  context "#root_node" do
    it "is nil if empty" do
      tree = Tree.new
      tree.root_node.should == nil
    end

    it "takes a tree and returns the root_node if not empty" do
      node = Node.new('hazelnut')
      tree = Tree.new(node)
      tree.root_node.should be_an_instance_of(Node)
      tree.root_node.should == node
    end
  end

# context "#branch" do
#   it "takes a node and re" do
#     tree = Tree.new(Node.new("Joe", [Node.new("Sally"), Node.new("Kimberly"), Node.new("Peg")]))
#   end
# end

  context "sibling_values" do
    it "takes a node and returns an array of the values of the siblings" do
      pending
      first_sibling = Node.new("Bart")
      second_sibling = Node.new("Lisa")
      third_sibling = Node.new("Maggie")
      node = Node.new("Homer", [first_sibling, second_sibling, third_sibling])
      tree = Tree.new(node)
      tree.root_node.sibling_values.should == ["Bart", "Lisa", "Maggie"]
    end
  end
end
