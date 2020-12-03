//Day 1 is contained in here
var lines = readTextFile(file: "day3", separatedBy: .newlines)
lines.removeLast()//Weird bug where the last array is always empty. Can't delete manually.
var trees = 0
let slopes = [(1,1), (1,3), (1,5), (1,7), (2,1)]
print(lines)
var result = [Int]()
for (deltaX, deltaY) in slopes{
    var x = 0
    var y = 0
    var trees = 0
    while x < lines.count{
        let yIndex = lines[x].index(lines[x].startIndex, offsetBy: y)
        if lines[x][yIndex] == "#"{
            trees += 1
        }
        y = (y+deltaY)%(lines[x].count)
        x += deltaX
    }
    result.append(trees)
}
print(result.reduce(1, {$0 * $1}))

