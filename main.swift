public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}


func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
    var result: [TreeNode?] = []
    var groups: [String: [TreeNode]] = [:]

    @discardableResult func dfs(_ root: TreeNode?) -> String {
        guard let root = root else { return "nil," }

        let left = dfs(root.left)
        let right = dfs(root.right)
        let serialize = "\(root.val),\(left),\(right),"

        groups[serialize, default: []].append(root)

        return serialize
    }

    dfs(root)

    for subtrees in groups.values where subtrees.count > 1 {
        result.append(subtrees.first!)
    }

    return result
}
