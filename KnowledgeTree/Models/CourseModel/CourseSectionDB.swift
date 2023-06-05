//
//  CourseSectionDB.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 08.03.2023.
//

import Foundation


var section1Geom = CourseSection(title: "Основы Геометрии", subtitle: "7 разделов - 30 часов", text: "Вы познакомитесь с основными возможностями геометрии", image: "geom_course", background: "Background 1", icon: "c++_icon", activities: activities)

var section1 = CourseSection(title: "Основы С++", subtitle: "7 разделов - 30 часов", text: "Вы познакомитесь с основными возможностями языка С++", image: "c++_course", background: "Background 1", icon: "c++_icon", activities: activities)

var section2 = CourseSection(title: "Git, базовые алгоритмы", subtitle: "11 разделов - 30 часов", text: "Изучите возможности версионирования кода", image: "c++_course", background: "Background 1", icon: "git_icon", activities: activities1)

var section3 = CourseSection(title: "Тестирование", subtitle: "4 раздела - 15 часов", text: "Вы научитесь разбивать код и тестировать его", image: "c++_course", background: "Background 1", icon: "testing_icon", activities: activities)

var section4 = CourseSection(title: "Классы и ООП", subtitle: "9 разделов - 25 часов", text: "Освойте мощь и гибкость классов", image: "c++_course", background: "Background 1", icon: "c++_icon", activities: activities)

var section5 = CourseSection(title: "Потоки", subtitle: "11 разделов - 30 часов", text: "Вы научитесь как улучшить скорость работы кода", image: "c++_course", background: "Background 1", icon: "c++_icon", activities: activities)

var section6 = CourseSection(title: "Управление памятью", subtitle: "11 разделов - 30 часов", text: "Вы научитесь избегать утечек памяти", image: "c++_course", background: "Background 1", icon: "c++_icon", activities: activities)

var section7 = CourseSection(title: "Многопоточность", subtitle: "11 разделов - 30 часов", text: "Вы научитесть писать асинхронный код", image: "c++_course", background: "Background 1", icon: "c++_icon", activities: activities)

var section8 = CourseSection(title: "Пространство имен", subtitle: "11 разделов - 30 часов", text: "Вы научитесь избегать некоторых ошибок при работе с кодом", image: "c++_course", background: "Background 1", icon: "c++_icon", activities: activities)

var section9 = CourseSection(title: "Элегантность кода", subtitle: "11 разделов - 30 часов", text: "Вы научитесь сохранять код в чистоте и порядке", image: "c++_course", background: "Background 1", icon: "c++_icon", activities: activities)

var newSection = CourseSection(title: "Основные функции С++", subtitle: "5 разделов - 10 часов", text: "Вы научитесь основным функциям языка С++", image: "c++_course", background: "Background 1", icon: "c++_icon", activities: activities)

var cPlusPlusSections = [
    section1,
    section2,
    section3,
    section4,
    section5,
    section6,
    section7,
    section8,
    section9
]

var GeomSections = [
    section1Geom,
    section2,
    section3,
    section4,
]

var sectionProgrammGeom: [SectionProgramm] = [
    SectionProgramm(section: section1Geom, childSections: [section2], category: .base),
    SectionProgramm(section: section2, childSections: [section3], category: .advanced),
    SectionProgramm(section: section3, childSections: [section4], category: .advanced),
    SectionProgramm(section: section4, childSections: [], category: .advanced),
]

var sectionProgramm: [SectionProgramm] = [
    
    SectionProgramm(section: section1, childSections: [section2, section3, section4], category: .base),
    SectionProgramm(section: section2, childSections: [section5], category: .advanced),
    SectionProgramm(section: section3, childSections: [], category: .advanced),
    SectionProgramm(section: section4, childSections: [], category: .advanced),
    SectionProgramm(section: section5, childSections: [section6, section7], category: .advanced),
    SectionProgramm(section: section6, childSections: [], category: .advanced),
    SectionProgramm(section: section7, childSections: [section8, section9], category: .advanced),
    SectionProgramm(section: section8, childSections: [], category: .advanced),
    SectionProgramm(section: section9, childSections: [], category: .advanced)
    
]

func rebuildSectionProgramm(index: Int, newSection: CourseSection) {
    guard index != 0 && index < sectionProgramm.count else { return }
    sectionProgramm[index - 1].removeChilds(childs: [sectionProgramm[index].getSection()])
    sectionProgramm[index - 1].addChilds(childs: [newSection])
    let newSectionProgramm: SectionProgramm = SectionProgramm(section: newSection, childSections: [sectionProgramm[index].getSection()], category: .advanced)
    sectionProgramm.insert(newSectionProgramm, at: index)
}

//func getSectionFromIndex(index: Int) -> CourseSection {
//    return sectionProgramm[index].getSection()
//}
