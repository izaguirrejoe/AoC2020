import Foundation

//Part B only

let lines = try String(contentsOfFile: "day6").components(separatedBy: .newlines)

var result = 0
var map = [Character:Int]()
var lineCount = 0
for line in lines{
    if line == ""{
        map = map.filter {$0.value == lineCount}
        result += map.count
        lineCount = 0
        map = [Character:Int]()
        continue
    }
    for char in line{
        map[char, default: 0] += 1
    }
    lineCount += 1
}

print(result)

//Alternate solutions

//Part A
print(groups.reduce(0){$0 + $1.reduce(into: Set<Character>()){$0.formUnion($1)}.count})

//Part B
print(groups.reduce(0){$0 + $1.reduce(into: Set<Character>($1.first!)){$0.formIntersection($1)}.count})

