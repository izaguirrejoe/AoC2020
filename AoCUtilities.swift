//
//  AoCUtilities.swift
//  SwiftAlgorithmPlayground
//
//  Created by Joseph Izaguirre on 12/1/20.
//  Copyright © 2020 FlorenceFire. All rights reserved.
//

import Foundation

func readTextFile(file: String, separatedBy separator: CharacterSet) -> [String]{
    let text = try! String(contentsOfFile: file, encoding: .utf8)
    return text.components(separatedBy: separator)
}

func readTextFile(file: String, separatedBy separator: String) -> [String]{
    let text = try! String(contentsOfFile: file, encoding: .utf8)
    return text.components(separatedBy: separator)
}
