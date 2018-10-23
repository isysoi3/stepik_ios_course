//
//  main.swift
//  FirstCourseSecondTask
//
//  Copyright © 2017 E-Legion. All rights reserved.
//

import Foundation
import FirstCourseSecondTaskChecker

//MARK: - my funcs to solve task

func countEvenAndOddNumbers(_ array: [Int]) -> (evenCount: Int, oddCount: Int) {
    var evenCount = 0
    array.forEach {
        evenCount += ($0 % 2 == 0 ? 1 : 0)
    }
    return (evenCount, array.count - evenCount)
}

func convertEmployeeDataToEmployees(_ employeeDataArray: [Checker.EmployeeData]) -> [Checker.Employee] {
    var result: [Checker.Employee] = []
    
    employeeDataArray.forEach {
        guard let fullName = $0["fullName"],
            let salary = $0["salary"] ,
            let company = $0["company"],
            $0.count == 3 else {
                return
        }
        
        result.append(Checker.Employee(fullName: fullName, salary: salary, company: company))
    }
    
    return result
}

func convertToDict(array: [String]) -> [String : [String]] {
    var result: [String : [String]] = [:]
    let sortedArray = array.sorted().reversed()
    
    sortedArray.forEach {
        guard let firstChar = $0.first else {
            return
        }
        let firstLetter = String(firstChar)
        
        if result[firstLetter] == nil {
            result[firstLetter] = [$0]
        } else {
            result[firstLetter]?.append($0)
        }
    }
    
    return result.filter {
        $0.value.count >= 2
    }
}

func sortCircles(_ circles: [Checker.Circle]) -> [Checker.Circle] {
    print(circles)
    
    let filteredResult = circles.filter({$0.color != .red})
    var mappedResult = filteredResult.map { (oldCircle: Checker.Circle) -> Checker.Circle in
        var circle = Checker.Circle(cirlce: oldCircle)
        switch circle.color {
        case .green:
            circle.color = .blue
        case .black:
            circle.radius *= 2
        default:
            break
        }
        return circle
    }
    let whiteCircles = mappedResult.filter {
        $0.color == .white
    }
    mappedResult.removeAll {
        $0.color == .white
    }
    
    let blueCircles = mappedResult.filter {
        $0.color == .blue
    }
    mappedResult.removeAll {
        $0.color == .blue
    }

    
    return whiteCircles + mappedResult + blueCircles
    
}

extension Checker.Circle {
    
    init(cirlce: Checker.Circle) {
        self.init(radius: cirlce.radius, color: cirlce.color)
    }
    
}

//MARK: - checker

let checker = Checker()


checker.checkFirstFunction(function: countEvenAndOddNumbers)

checker.checkSecondFunction(function: sortCircles)

checker.checkThirdFunction(function: convertEmployeeDataToEmployees)

checker.checkFourthFunction(function: convertToDict)


