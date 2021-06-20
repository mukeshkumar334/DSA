
//IDE Used: Visual Studio Code
//
import Foundation

public class BinarySearchTreeNode {
    public fileprivate(set) var value: Int
    public fileprivate(set) var leftNode: BinarySearchTreeNode?
    public fileprivate(set) var rightNode: BinarySearchTreeNode?
    
    fileprivate init(value: Int) {
        self.value = value
    }
}

public enum TraversalOrder: Int {
    case preorder, inorder, postorder
}

public class BinarySearchTree {
    public private(set) var rootNode: BinarySearchTreeNode
    private var items = [Int]()
    
    public init(value: Int) {
        self.rootNode = BinarySearchTreeNode(value: value)
    }
    
    //Add Method
    public func add(_ value: Int) {
        add(value, parentNode: rootNode)
    }
    
    //Traverse Method
    public func traverse(order: TraversalOrder = .preorder, _ completion: (_ value: Int) -> Void) {
        items = []
        traverse(self.rootNode, order: order, completion)
    }
    
    //Remove Method
    public func remove(_ value: Int) {}
    
    private func add(_ value: Int, parentNode node: BinarySearchTreeNode) {
        if value < node.value  {
            if let leftNode = node.leftNode {
                add(value, parentNode: leftNode)
            } else {
                node.leftNode = BinarySearchTreeNode(value: value)
            }
            
        } else {
            if let rightNode = node.rightNode {
                add(value, parentNode: rightNode)
            } else {
                node.rightNode = BinarySearchTreeNode(value: value)
            }
        }
    }
    
    private func traverse(_ node: BinarySearchTreeNode?, order: TraversalOrder, _ completion: (_ value: Int) -> Void) {
        guard let node = node else {
            return
        }
        
        switch order {
        case .preorder:
            completion(node.value)
            traverse(node.leftNode, order: order, completion)
            traverse(node.rightNode, order: order, completion)
        case .inorder:
            traverse(node.leftNode, order: order, completion)
            completion(node.value)
            traverse(node.rightNode, order: order, completion)
        case .postorder:
            traverse(node.leftNode, order: order, completion)
            traverse(node.rightNode, order: order, completion)
            completion(node.value)
            
        }
    }
}





//MARK: - Testing

//TestCase-1
//Test Add Method
let bst = BinarySearchTree(value: 10)
bst.add(20)
bst.add(15)
assert(bst.rootNode.leftNode == nil)
assert(bst.rootNode.value == 10)
assert(bst.rootNode.rightNode != nil)
assert(bst.rootNode.rightNode?.value == 20)
assert(bst.rootNode.rightNode?.leftNode?.value == 15)
assert(bst.rootNode.rightNode?.rightNode == nil)
bst.add(5)
assert(bst.rootNode.leftNode != nil)
assert(bst.rootNode.leftNode?.value == 5)
assert(bst.rootNode.leftNode?.leftNode == nil)
assert(bst.rootNode.leftNode?.rightNode == nil)
bst.add(25)
bst.add(13)
bst.add(7)
bst.add(26)
bst.add(10)
bst.add(14)
bst.add(6)
bst.add(9)
assert(bst.rootNode.leftNode?.rightNode?.leftNode?.value == 6)
assert(bst.rootNode.rightNode?.leftNode?.leftNode?.leftNode?.value == 10)
assert(bst.rootNode.rightNode?.leftNode?.value == 15)
assert(bst.rootNode.rightNode?.rightNode?.rightNode?.value == 26)

//TestCase-2
//Test Traversal
//Preorder
var expectedList = [10,5,7,6,9,20,15,13,10,14,25,26]
var outputList = [Int]()
bst.traverse(order: .preorder) { (value) in
    outputList.append(value)
}
assert(expectedList == outputList)

//Inorder
expectedList = [5,6,7,9,10,10,13,14,15,20,25,26]
outputList = []
bst.traverse(order: .inorder) { (value) in
    outputList.append(value)
}
assert(expectedList == outputList)

//Postorder
expectedList = [6,9,7,5,10,14,13,15,26,25,20,10]
outputList = []
bst.traverse(order: .postorder) { (value) in
    outputList.append(value)
}
assert(expectedList == outputList)
print("Test Succeeded!")
