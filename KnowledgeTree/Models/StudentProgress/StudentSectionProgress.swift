//
//  StudentSectionProgress.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 28.02.2023.
//

import Foundation


class StudentSectionProgress: ObservableObject {
    
    private var course: Course
    private var openSections: [CourseSection]
    
    init(course: Course, openSections: [CourseSection]) {
        self.course = course
        self.openSections = openSections
    }
}

extension StudentSectionProgress {
    
    func getActivities(sectionTitle: String) -> [ActivityType] {
        var activities: [ActivityType] = []
        for section in openSections {
            if section.title == sectionTitle {
                activities.append(contentsOf: section.activities)
            }
        }
        return activities
    }
    
    func doneActivity(sectionTitle: String, activityTitle: String) {
        for section in openSections {
            if section.title == sectionTitle {
                for activity in section.activities {
                    if activity.title == activityTitle {
                        activity.done()
                    }
                }
            }
        }
    }
    
    func addSectionToOpen(section: CourseSection) {
        openSections.append(section)
    }
    
    func getCourse() -> Course {
        return course
    }
    
    func getOpenSections() -> [CourseSection] {
        return openSections
    }
}
