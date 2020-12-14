import Foundation

let lines = try String(contentsOfFile: "day12").trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: "\n")

var instructions = [(Character, Int)]()
for line in lines{
    let action = Character(extendedGraphemeClusterLiteral: line.first!)
    let value = Int(line.suffix(line.count - 1))!
    instructions.append((action,value))
}

//Part 1
//var x = 0, y = 0
//var direction = 0
//
//for instruction in instructions{
//    print("Start:", x, y, direction)
//    let action = instruction.0
//    let value = instruction.1
//    switch(action){
//    case "N":
//        y += value
//
//    case "S":
//        y -= value
//
//    case "E":
//        x += value
//
//    case "W":
//        x -= value
//
//    case "L":
//        direction += value
//
//    case "R":
//        direction -= value
//
//    case "F":
//
//        x += value * Int(cos(Double(direction)*Double.pi/180))
//        y += value * Int(sin(Double(direction)*Double.pi/180))
//
//    default:
//        fatalError()
//    }
//    print("End", x ,y, direction, "\n")
//}

//Part 2
var x = 0, y = 0
var waypoint = (10,1)

for instruction in instructions{
    print("Start: \(x) \(y)")

    let action = instruction.0
    let value = instruction.1
    switch(action){
    case "N":
        waypoint.1 += value

    case "S":
        waypoint.1 -= value

    case "E":
        waypoint.0 += value

    case "W":
        waypoint.0 -= value

    case "L":
        if value == 180{
            waypoint.0 = -waypoint.0
            waypoint.1 = -waypoint.1
        }
        else if value == 90{
            let newX = -waypoint.1
            waypoint.1 = waypoint.0
            waypoint.0 = newX
        }
        else if value == 270{
            let newX = waypoint.1
            waypoint.1 = -waypoint.0
            waypoint.0 = newX
        }
        else{
            fatalError()
        }
        
    case "R":
        if value == 180{
            waypoint.0 = -waypoint.0
            waypoint.1 = -waypoint.1
        }
        else if value == 90{
            let newX = waypoint.1
            waypoint.1 = -waypoint.0
            waypoint.0 = newX
        }
        else if value == 270{
            let newX = -waypoint.1
            waypoint.1 = waypoint.0
            waypoint.0 = newX
        }
        else{
            fatalError()
        }

    case "F":
        x += waypoint.0 * value
        y += waypoint.1 * value

    default:
        fatalError()
    }
    print("End: \(x) \(y) \n")
}

print(abs(x) + abs(y))

