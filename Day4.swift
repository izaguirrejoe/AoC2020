let input = readTextFile(file: "day4", separatedBy: .newlines)
var passports = Array<[String]>(), current = [String]()
for string in input{
    if string == ""{
        passports.append(current)
        current = [String]()
    }
    else{
        let stringArr = string.split(separator: " ").map {String($0)}
        current.append(contentsOf: stringArr)
    }
}
passports.append(current)
var passportDict = Array<[String:String]>()
for passport in passports{
    var currDict = [String:String]()
    for pair in passport{
        let colonIndex = pair.firstIndex(of: ":")!
        let key = String(pair[pair.startIndex..<colonIndex])
        let afterColon = pair.index(after: colonIndex)
        let value = String(pair[afterColon...])
        currDict[key] = value
    }
    passportDict.append(currDict)
}

var result = 0
for passport in passportDict{
    if (passport.keys.count == 7 && passport["cid"] == nil) || passport.keys.count == 8{
        guard let birthYearString = passport["byr"],
              let issueYearString = passport["iyr"],
              let expirationYearString = passport["eyr"],
              let height = passport["hgt"],
              let eyeColorString = passport["ecl"],
              let passportIDString = passport["pid"],
              let hairColorString = passport["hcl"]
              else {fatalError()}
        
        //Validate birth year, issue year, passport ID and expiration year
        guard birthYearString.count == 4, let birthYear = Int(birthYearString), (1920...2002).contains(birthYear), issueYearString.count == 4, let issueYear = Int(issueYearString), (2010...2020).contains(issueYear), expirationYearString.count == 4, let expirationYear = Int(expirationYearString), (2020...2030).contains(expirationYear), passportIDString.count == 9, Int(passportIDString) != nil else {continue}
        
        //Validate eye color string
        guard ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"].contains(eyeColorString) else {continue}
        
        //Validate height
        let units = height.suffix(2)
        let number = Int(height.prefix(height.count-2))!
        guard (units == "cm" && (150...193).contains(number)) || (units == "in" && (59...76).contains(number)) else {continue}
        
        //Validate hair color string
        let pattern = #"#([0-9|a-f]{6})"#
        let regex = try NSRegularExpression(pattern: pattern, options: [])
        let nsrange = NSRange(hairColorString.startIndex..<hairColorString.endIndex, in: hairColorString)
        let matches = regex.matches(in: hairColorString, options: [], range: nsrange)
        guard matches.count == 1, matches[0].numberOfRanges == 2 else {continue}
        result += 1
    }
}
