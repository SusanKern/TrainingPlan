//
//  Model.swift
//  TrainingPlan
//
//  Created by Susan Kern on 6/3/20.
//  Copyright © 2020 SKern. All rights reserved.
//

import Foundation

enum TrainingCategory : Int {
    case interviewPrep, designPatterns, currentStateOfTech, codingPractice
}

// A Training Task is something like "watch WWDC video" along with the time it will take
struct TrainingTask {
    var name: String
    var minutes: Int
}

// Each WeeklyPlan includes some of each category of training.  
struct WeeklyPlan {
    var taskList: [(task: TrainingTask, category: TrainingCategory)] = []

    var totalMinutes: Int {
        return taskList.reduce(0, { $0 + $1.task.minutes })
    }
    
    func getTasks(for category: TrainingCategory) -> [TrainingTask]? {
        return taskList.filter( { $0.category == category } ).map( { $0.task } )
    }
}
