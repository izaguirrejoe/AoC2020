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

//Alternate solution
import Foundation

let groups = try String(contentsOfFile: "day6").trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: "\n\n").map{$0.components(separatedBy: .newlines)}

var partA = 0
for group in groups{
    partA += group.reduce(into: Set<Character>()) {$0.formUnion($1)}.count
}
print(partA)

var partB = 0
for group in groups{
    partB += group.reduce(into: Set<Character>(group.first!)) {$0.formIntersection($1)}.count
}
print(partB)

