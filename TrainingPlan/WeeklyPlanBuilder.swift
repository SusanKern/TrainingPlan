//
//  WeeklyPlanBuilder.swift
//  TrainingPlan
//
//  Created by Susan Kern on 6/3/20.
//  Copyright © 2020 SKern. All rights reserved.
//

import Foundation

// Because this use case involves composing a rather complex object from other objects, we use the "Builder" pattern.  The creation of the "Weekly Plan" is done by a separate "Builder" class that creates the plan in steps.
class WeeklyPlanBuilder {
    
    //MARK: Properties
    
    private var weeklyPlan: WeeklyPlan?
    
    
    //MARK: Public Methods
    
    func reset() {
        weeklyPlan = WeeklyPlan()
    }
    
    func setInterviewPrep(_ task: TrainingTask) {
        set(task, withCategory: .interviewPrep)
    }
    
    func setDesignPatterns(_ task: TrainingTask) {
        set(task, withCategory: .designPatterns)
    }
    
    func setCurrentStateOfTech(_ task: TrainingTask) {
        set(task, withCategory: .currentStateOfTech)
    }
    
    func setCodingPractice(_ task: TrainingTask) {
        set(task, withCategory: .codingPractice)
    }
    
    func getWeeklyPlan() -> WeeklyPlan? {
        return weeklyPlan ?? nil
    }
    
    
    //MARK: Private Methods
    
    private func set(_ task: TrainingTask, withCategory trainingCategory: TrainingCategory) {
        weeklyPlan?.taskList.append((task, trainingCategory))
    }
}
