import Foundation

let instructions = try String(contentsOfFile: "day8").trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: "\n")

let pattern = #"(\w+) ([+,-]?\d+)"#
let regex = try NSRegularExpression(pattern: pattern, options: [])

var instructionArray = [(String,Int)]()

for instruction in instructions{
    let nsrange = NSRange(instruction.startIndex..<instruction.endIndex, in: instruction)
    let match = regex.firstMatch(in: instruction, options: [], range: nsrange)
    let wordRange = Range(match!.range(at: 1), in: instruction)!
    let abbrev = String(instruction[wordRange])
    let numRange = Range(match!.range(at: 2), in: instruction)!
    let number = Int(instruction[numRange])!
    instructionArray.append((abbrev, number))
}

var instructionArrayCpy = instructionArray
for i in 0..<instructionArrayCpy.count{
    print("Currently experimenting with line: ", i)
    instructionArrayCpy = instructionArray
    if instructionArrayCpy[i].0 == "jmp"{
        instructionArrayCpy[i].0 = "nop"
    }
    else if instructionArrayCpy[i].0 == "nop"{
        instructionArrayCpy[i].0 = "jmp"
    }
    else{
        print("Accumulator line. Reverting.")
        continue
    }
    
    var seen = Set<Int>()
    var i = 0
    var accumulator = 0
    while(0 <= i && i < instructionArrayCpy.count && !seen.contains(i)){
        seen.insert(i)
        switch instructionArrayCpy[i].0{
        case "acc":
            accumulator += instructionArrayCpy[i].1
            i += 1
        
        case "jmp":
            i += instructionArrayCpy[i].1
        
        default:
            i += 1
        }
    }
    if i == instructionArrayCpy.count{
        print("End of file reachced")
        print(accumulator)
    }
    else{
        print("Loop reached. Reverting.")
    }
}



