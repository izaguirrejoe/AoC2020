import Foundation

let lines = try String(contentsOfFile: "day7").trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: "\n")

var contains = [String:[(Int,String)]]()
var containedIn = [String:Set<String>]()

for line in lines{
    let pattern = #"(.+?) bags"#
    let regex = try NSRegularExpression(pattern: pattern, options: [])
    let nsrange = NSRange(line.startIndex..<line.endIndex, in: line)
    let match = regex.firstMatch(in: line, options: [], range: nsrange)!
    let colorRange = Range(match.range(at: 1), in: line)!
    let color = String(line[colorRange])
    
    let pattern2 = #"(\d+) (.+?) bags?[,.]"#
    let regex2 = try NSRegularExpression(pattern: pattern2, options: [])
    for match in regex2.matches(in: line, options: [], range: nsrange){
        let numRange = Range(match.range(at: 1), in: line)
        let num = Int(line[numRange!])!
        let innerColorRange = Range(match.range(at: 2), in: line)
        let innerColor = String(line[innerColorRange!])
        contains[color, default: [(Int,String)]()].append((num,innerColor))
        containedIn[innerColor, default: Set<String>()].insert(color)
    }
}

let s = Solution()
print(s.helper(string: "shiny gold"))


//class Solution {
//    var result = Set<String>()
//    func searchContains(string: String){
//        guard let containedIn = containedIn[string] else {return}
//        for color in containedIn{
//            print(color)
//            result.insert(color)
//            contains(string: color)
//        }
//    }
//}

class Solution {
    func helper(string: String) -> Int{
        print("Here")
        var result = 1
        guard let contains = contains[string] else {return result}
        for (count, color) in contains{
            result += count * helper(string: color)
        }
        return result
    }
}

