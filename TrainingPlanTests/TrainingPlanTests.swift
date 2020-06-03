//
//  TrainingPlanTests.swift
//  TrainingPlanTests
//
//  Created by Susan Kern on 6/3/20.
//  Copyright © 2020 SKern. All rights reserved.
//

import XCTest
@testable import TrainingPlan

class TrainingPlanTests: XCTestCase {
    
    func testNoTasks() {
        let builder = WeeklyPlanBuilder()
        builder.reset()
        
        XCTAssert(builder.getWeeklyPlan()?.getTasks(for: .currentStateOfTech)?.count == 0)
        XCTAssert(builder.getWeeklyPlan()?.getTasks(for: .designPatterns)?.count == 0)
        XCTAssert(builder.getWeeklyPlan()?.getTasks(for: .interviewPrep)?.count == 0)
        XCTAssert(builder.getWeeklyPlan()?.getTasks(for: .codingPractice)?.count == 0)
        XCTAssert(builder.getWeeklyPlan()?.taskList.count == 0)
    }

    func testAddingUniqueTasks() {
        let video1 = TrainingTask(name: "Watch WWDC - Improving Battery Life and Performance", minutes: 40)
        let video2 = TrainingTask(name: "Watch WWDC - What's New in Swift", minutes: 37)
        let builderPattern = TrainingTask(name: "Study Builder design pattern", minutes: 120)
        let generalQuestions = TrainingTask(name: "Practice General Interview questions", minutes: 30)
        let codingPractice = TrainingTask(name: "Write Unit tests with XCTest", minutes: 45)

        let builder = WeeklyPlanBuilder()
        builder.reset()
        builder.setCurrentStateOfTech(video1)
        builder.setCurrentStateOfTech(video2)
        builder.setDesignPatterns(builderPattern)
        builder.setInterviewPrep(generalQuestions)
        builder.setCodingPractice(codingPractice)

        XCTAssert(builder.getWeeklyPlan()?.getTasks(for: .currentStateOfTech)?.count == 2)
        XCTAssert(builder.getWeeklyPlan()?.getTasks(for: .designPatterns)?.count == 1)
        XCTAssert(builder.getWeeklyPlan()?.getTasks(for: .interviewPrep)?.count == 1)
        XCTAssert(builder.getWeeklyPlan()?.getTasks(for: .codingPractice)?.count == 1)
    }

    func testAddingDuplicateTasks() {
        let video1 = TrainingTask(name: "Watch WWDC - Improving Battery Life and Performance", minutes: 40)
        let video2 = TrainingTask(name: "Watch WWDC - What's New in App Store Connect", minutes: 31)

        let builder = WeeklyPlanBuilder()
        builder.reset()
        
        builder.setCurrentStateOfTech(video1)
        XCTAssert(builder.getWeeklyPlan()?.getTasks(for: .currentStateOfTech)?.count == 1)
        builder.setCurrentStateOfTech(video2)
        XCTAssert(builder.getWeeklyPlan()?.getTasks(for: .currentStateOfTech)?.count == 2)
        builder.setCurrentStateOfTech(video2)
        XCTAssert(builder.getWeeklyPlan()?.getTasks(for: .currentStateOfTech)?.count == 3)
    }
    
    func testTimeCalculation() {
        let video1 = TrainingTask(name: "Watch WWDC - Improving Battery Life and Performance", minutes: 40)
        let video2 = TrainingTask(name: "Watch WWDC - What's New in Swift", minutes: 37)
        let builderPattern = TrainingTask(name: "Study Builder design pattern", minutes: 120)
        let generalQuestions = TrainingTask(name: "Practice General Interview questions", minutes: 30)
        let codingPractice = TrainingTask(name: "Write Unit tests with XCTest", minutes: 45)
        let totalMinutes = video1.minutes + video2.minutes + builderPattern.minutes + generalQuestions.minutes + codingPractice.minutes

        let builder = WeeklyPlanBuilder()
        builder.reset()
        builder.setCurrentStateOfTech(video1)
        builder.setCurrentStateOfTech(video2)
        builder.setDesignPatterns(builderPattern)
        builder.setInterviewPrep(generalQuestions)
        builder.setCodingPractice(codingPractice)

        XCTAssert(builder.getWeeklyPlan()?.totalMinutes == totalMinutes)
    }
}
