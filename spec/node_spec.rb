require File.join(File.dirname(__FILE__), 'spec_helper')

describe Node do

  context "#new" do
    it "takes a string or integer and returns a node object" do
      node = Node.new("hello")
      node.should be_an_instance_of(Node)
    end
    it "when given one argument, children defaults to nil" do
      node = Node.new("ola")
      node.data.should == "ola"
      node.children.should == []
    end
    it "takes an array of nodes for the second argument and create children" do
      second_node = Node.new("second")
      third_node = Node.new("third")
      fourth_node = Node.new("fourth")
      array = [second_node, third_node, fourth_node]
      node = Node.new("first", array)
      node.data.should == "first"
      node.children.should == array
    end
  end

  context "#data" do
    it "takes a node and returns the node's data" do
      node_with_string = Node.new("string")
      node_with_integer = Node.new(649)
      node_with_array = Node.new([2, 3, 4])
      node_with_hash = Node.new({:one => 1, :two => 2})
      node_with_string.data.should == "string"
      node_with_integer.data.should == 649
      node_with_array.data.should == [2, 3, 4]
      node_with_hash.data.should == {:one => 1, :two => 2}
    end
  end

  context "#children" do
    it "takes a node and returns the child nodes" do
      second_node = Node.new("beta")
      third_node = Node.new("delta")
      fourth_node = Node.new("gamma")
      array = [second_node, third_node, fourth_node]
      node = Node.new("alpha", array)
      node.children.should == array
    end
  end

  context "#add_children" do
    it "takes an array of nodes and connects them as children to the parent node returning the array of nodes passed in as argument" do
      node = Node.new("no children to start")
      node.children.should == []
      array = [Node.new("red"), Node.new("green"), Node.new("blue")]
      node.add_children(array).should be_an_instance_of(Array)
      node.children[0].data.should == "red"
      node.children[1].data.should == "green"
      node.children[2].data.should == "blue"
    end
  end

  context "#remove_children" do
    it "takes an array of nodes and removes them as children from the parent node returning the array of nodes passed in as argument" do
      array = [Node.new("larry"), Node.new("curly"), Node.new("moe")]
      node = Node.new("stooges for children", array)
      node.children.should == array
      node.remove_children(array).should be_an_instance_of(Array)
      node.children.should == []
    end
    it "only deletes the nodes passed in the array" do
      array = [Node.new("apple"), Node.new("banana")]
      node = Node.new("fruit bowl", [array, Node.new("orange"), Node.new("strawberry")].flatten)
      node.children.length.should == 4
      node.remove_children(array)
      node.children[0].data.should == "orange"
      node.children[1].data.should == "strawberry"
      node.children.length.should == 2
    end
  end

  context "#leaf_node?" do
    it "takes a node and returns true if the node has no children" do
      node = Node.new("leaf node")
      node.leaf_node?.should == true
    end
  end

  context "#sibling_values" do
    it "takes a node and returns an array" do
      first_sibling = Node.new("Bart")
      second_sibling = Node.new("Lisa")
      third_sibling = Node.new("Maggie")
      node = Node.new("Homer", [first_sibling, second_sibling, third_sibling])
      node.sibling_values.should == ["Bart", "Lisa", "Maggie"]
    end
  end

end
