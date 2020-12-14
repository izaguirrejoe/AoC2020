import Foundation

var grid = try String(contentsOfFile: "day11").trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: "\n").reduce(into: [[Character]]()){$0.append(Array($1))}

var count = 0
mainLoop: while true{
    let gridCpy = grid
    for line in grid{
        print(line)
    }
    for row in 0..<gridCpy.count{
        for col in 0..<gridCpy[0].count{
            var neighbors = 0
            //Up
            for i in stride(from: row-1, to: -1, by: -1){
                if gridCpy[i][col] == "#"{
                    neighbors += 1
                    break
                }
                if gridCpy[i][col] == "L"{
                    break
                }
            }
            
            //Down
            for i in stride(from: row+1, to: gridCpy.count, by: 1){
                if gridCpy[i][col] == "#"{
                    neighbors += 1
                    break
                }
                if gridCpy[i][col] == "L"{
                    break
                }
            }
            
            for i in stride(from: col-1, to: -1, by: -1){
                if gridCpy[row][i] == "#"{
                    neighbors += 1
                    break
                }
                if gridCpy[row][i] == "L"{
                    break
                }
            }
            
            for i in stride(from: col+1, to: gridCpy[0].count, by: 1){
                if gridCpy[row][i] == "#"{
                    neighbors += 1
                    break
                }
                if gridCpy[row][i] == "L"{
                    break
                }
            }
            
            //up left
            var r = row - 1, c = col - 1
            while r >= 0  && c >= 0{
                if gridCpy[r][c] == "#"{
                    neighbors += 1
                    break
                }
                if gridCpy[r][c] == "L"{
                    break
                }
                r -= 1
                c -= 1
            }
            
            //Up right
            r = row - 1
            c = col + 1
            while r >= 0  && c < gridCpy[0].count{
                if gridCpy[r][c] == "#"{
                    neighbors += 1
                    break
                }
                if gridCpy[r][c] == "L"{
                    break
                }
                r -= 1
                c += 1
            }

            //Down left
            r = row + 1
            c = col - 1
            while r < gridCpy.count  && c >= 0{
                if gridCpy[r][c] == "#"{
                    neighbors += 1
                    break
                }
                if gridCpy[r][c] == "L"{
                    break
                }
                
                r += 1
                c -= 1
            }
            
            //Down Right
            r = row + 1
            c = col + 1
            while r < gridCpy.count  && c < gridCpy[0].count{
                if gridCpy[r][c] == "#"{
                    neighbors += 1
                    break
                }
                if gridCpy[r][c] == "L"{
                    break
                }
                r += 1
                c += 1
            }
            
            if count == 1 && row == 0 && col == 2{
                print(grid[row][col])
                print("Neighbors: ", neighbors)
            }

            switch grid[row][col]{
            case "L":
                if neighbors == 0{
                    grid[row][col] = "#"
                }
                
            case "#":
                if neighbors >= 5{
                    grid[row][col] = "L"
                }
                
            case ".":
                break
                
            default:
                print(gridCpy[row][col])
                fatalError()
            }
        }
    }
    
    if grid == gridCpy{
        print("Steady state")
        break mainLoop
    }
    print("Completed \(count)\n")
    count += 1
}

let total = grid.reduce(0) {$0 + $1.reduce(0, {$0 + ($1 == "#" ? 1 : 0)})}

print(total)



