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

let lines = try String(contentsOfFile: "day6").components(separatedBy: .newlines)
var result = 0
var group = [Set<Character>]()
for line in lines{
    if line == ""{
        let intersection = group.reduce(group.first!) {$0.intersection($1)}
        result += intersection.count
        group = [Set<Character>]()
        continue
    }
    var passenger = Set<Character>()
    for char in line{
        passenger.insert(char)
    }
    group.append(passenger)
}
print(result)

