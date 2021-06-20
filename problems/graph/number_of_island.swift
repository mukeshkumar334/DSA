/*
####Number of Islands

Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.

An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.
*/


class Solution {
    var visited: [[Bool]] = []
    var row = 0
    var col = 0
    
    func numIslands(_ grid: [[Character]]) -> Int {
        row = grid.count
        col = grid[0].count
        visited = Array<[Bool]>(repeating: Array<Bool>(repeating: false, count: col), count: row)
        var islandCount = 0
        for rowPTR in 0..<row {
            for colPTR in 0..<col {
                if grid[rowPTR][colPTR] == "1" && visited[rowPTR][colPTR] == false {
                    //search for connected land in the grid
                    DFS(in: grid, row: rowPTR, col: colPTR)
                    islandCount += 1  
                }
            }
        }
        return islandCount
    }
    
    func DFS(in array: [[Character]], row: Int, col: Int) {
        //this is only for 4-directions: left, top, right, bottom
        let rowDir = [0, -1, 0, 1]
        let colDir = [-1, 0, 1, 0]
        visited[row][col] = true
        //search for connected land in all direction
        for k in 0..<4 {
            //search only if node is node visited, if it is not after boundaries
            let nextRow = row + rowDir[k]
            let nextCol = col + colDir[k]
            
            if isSafeToVisit(in: array, nextRow, nextCol) {
                //visited[nextRow][nextCol] = true
                DFS(in: array, row: nextRow, col: nextCol)
            }
        }
    }
    
    func isSafeToVisit(in array: [[Character]], _ row: Int, _ col: Int) -> Bool {
        return  row >= 0 && col >= 0 && row < self.row && col < self.col && !visited[row][col] && array[row][col] == "1"
    }
}
