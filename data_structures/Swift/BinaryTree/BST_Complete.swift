//Binary Serach Tree, not completed
//In progress....
import Foundation

class BinarySearchTree<T: Comparable> {
    fileprivate(set) public var value: T
    fileprivate(set) public weak var parent: BinarySearchTree<T>?
    fileprivate(set) public var leftChild: BinarySearchTree<T>?
    fileprivate(set) public var rightChild: BinarySearchTree<T>?
    
    init(value: T, leftChild: BinarySearchTree? = nil, rightChild: BinarySearchTree? = nil) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
    
    var isRoot: Bool {
        parent == nil
    }
    
    var isLeaf: Bool {
        leftChild == nil && rightChild == nil
    }
    var isLeftChild: Bool {
        parent?.leftChild === self
    }
    
    var isRightChild: Bool {
        parent?.rightChild === self
    }
    
    var hasLeftChild: Bool {
        leftChild != nil
    }
    
    var hasRightChild: Bool {
        rightChild != nil
    }
    
    var hasBothChild: Bool {
        hasLeftChild && hasRightChild
    }
    
    public var height: Int {
        if isLeaf {return  0}
        let lDepth = leftChild?.height ?? 0
        let rDepth = rightChild?.height ?? 0
        return 1 + (lDepth > rDepth ? lDepth : rDepth)
    }
    
    var depth: Int {
        var node = self
        var edges = 0
        
        while let parent = node.parent {
            node = parent
            edges += 1
        }
        
        return edges
    }
    
    var maximum: BinarySearchTree {
        guard hasRightChild else {return self}
        
        return rightChild!.maximum
    }
    
    var minimum: BinarySearchTree {
        guard hasLeftChild else {return self}
        
        return leftChild!.minimum
    }
    
    func insert(_ value: T) {
        if value < self.value {
            if let leftChild = self.leftChild {
                leftChild.insert(value)
            } else {
                leftChild = BinarySearchTree(value: value)
                leftChild?.parent = self
            }
        } else {
            if let rightChild = self.rightChild {
                rightChild.insert(value)
            } else {
                rightChild = BinarySearchTree(value: value)
                rightChild?.parent = self
            }
        }
    }
    
    func remove() {
        
        guard hasLeftChild || hasRightChild else {
            if isLeftChild {
                parent?.leftChild = nil
            } else {
                parent?.rightChild = nil
            }
            return
        }
        
        var replacement = hasLeftChild ? leftChild?.maximum : rightChild?.minimum
            
        //Assign values and left right child
        replacement?.value = value
        replacement?.leftChild = leftChild
        replacement?.rightChild = rightChild
        replacement?.parent = self.parent
        
            //assign ti the parent
        if isLeftChild {
            parent?.leftChild = replacement
        } else {
            parent?.rightChild = replacement
        }
        
        //remove ref
        self.parent = nil
        self.leftChild = nil
        self.rightChild = nil
    }
}

//Traversal
enum TraversalOrder {
    case preOrder
    case inOrder
    case postOrder
}

extension BinarySearchTree {
    func traverse(in order: TraversalOrder = .preOrder, process: (T) -> Void) {
        
        if order == .preOrder {
            process(value)
        }
        
        if let leftChild = leftChild {
            leftChild.traverse(in: order, process: process)
        }
        
        if order == .inOrder {
            process(value)
        }
        
        if let rightChild = rightChild {
            rightChild.traverse(in: order, process: process)
        }
        
        if order == .postOrder {
            process(value)
        }
    }
    
    func map(transform: (T) -> T) -> [T] {
        var a = [T]()
        
        if let leftChild = leftChild {
            a += leftChild.map(transform: transform)
        }
        
        a.append(value)
        
        if let rightChild = rightChild {
            a += rightChild.map(transform: transform)
        }
        return a
    }
  
    ///Travrese inOrder
    func filter(_ predicate: (T) -> Bool) -> [T] {
        var arr = [T]()
        
        if let leftChild = leftChild {
            arr += leftChild.filter(predicate)
        }
        
        if predicate(value) {
            arr.append(value)
        }
        
        if let rightChild = rightChild {
            arr += rightChild.filter(predicate)
        }
        return  arr
    }
} 

extension BinarySearchTree: CustomStringConvertible {
    var description: String {
        var s = ""
        if let leftChild = leftChild {
            s += leftChild.description + "<-"
        }
        
        s += "\(value)"
        
        if let rightChild = rightChild {
            s += "->" + rightChild.description
        }
        return s 
    }
}

var bst = BinarySearchTree(value: 8)
bst.insert(3)
bst.insert(10)
bst.insert(1)
bst.insert(6)
bst.insert(4)
bst.insert(7)
bst.insert(14)
bst.insert(13)
bst.insert(0)
bst.insert(34)
bst.insert(5)
bst.insert(2)

bst.traverse(in: .inOrder) { value in
    //print(value)
}

//  var arr = bst.map { value in
//      value * 2
//  }
//  
//  arr = bst.filter { value in
//      value % 2 != 0
//  }
let max = bst.maximum
print(max.value)
print("height: \(bst.height)")

bst.leftChild?.remove()

//print(bst)


