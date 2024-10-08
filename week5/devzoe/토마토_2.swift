import Foundation

func readInput() -> (Int, Int, [[Int]], [(Int, Int)]) {
    let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
    let n = nm[0]
    let m = nm[1]
    var arr :[[Int]] = [[]]
    var queue: [(Int, Int)] = []
    
    for _ in 1...m{
        arr.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    }    

    for i in 1...m{
        for j in 0..<n {
            if arr[i][j] == 1{
                queue.append((i, j))
            }
        }
    }
    return (n, m, arr, queue)
}

func bfs(lastIdx: inout (Int, Int), arr: inout [[Int]], queue: inout [(Int, Int)], depth: inout [[Int]]) {
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, 1, -1]
    var idx = 0
    
    while idx < queue.count{
        let pop = queue[idx]
        idx += 1
        for i in 0...3{
            let nx = pop.0 + dx[i]
            let ny = pop.1 + dy[i]
            
            if nx > 0 && nx <= m && ny >= 0 && ny < n{
                if arr[nx][ny] == 0{
                    arr[nx][ny] = 1
                    depth[nx][ny] = depth[pop.0][pop.1] + 1
                    queue.append((nx, ny))
                    lastIdx = (nx, ny)
                }
            }
        }
    }
}

var (n, m, arr, queue) = readInput()
var lastIdx = (0, 0)
var isCooked = true
var depth = Array(repeating: Array(repeating: 0, count: 1001), count: 1001)

bfs(lastIdx: &lastIdx, arr: &arr, queue: &queue, depth: &depth)

for i in 1...m {
    for j in 0..<n {
        if arr[i][j] == 0 {
            isCooked = false
        }
    }
}

if isCooked{
    print(depth[lastIdx.0][lastIdx.1])
} else {
    print(-1)
}