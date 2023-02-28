//
//  DataBaseCourseSection.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 22.02.2023.
//

import Foundation

var section1 = CourseSection(title: "Основы С++", subtitle: "7 разделов - 30 часов", text: "Вы познакомитесь с основными возможностями языка С++", image: "c++_course", background: "Background 1", icon: "c++_icon")

var section2 = CourseSection(title: "Git, базовые алгоритмы", subtitle: "11 разделов - 30 часов", text: "Изучите возможности версионирования кода", image: "c++_course", background: "Background 1", icon: "git_icon")

var section3 = CourseSection(title: "Тестирование", subtitle: "4 раздела - 15 часов", text: "Вы научитесь разбивать код и тестировать его", image: "c++_course", background: "Background 1", icon: "testing_icon")

var section4 = CourseSection(title: "Классы и ООП", subtitle: "9 разделов - 25 часов", text: "Освойте мощь и гибкость классов", image: "c++_course", background: "Background 1", icon: "c++_icon")

var section5 = CourseSection(title: "Потоки", subtitle: "11 разделов - 30 часов", text: "Вы научитесь как улучшить скорость работы кода", image: "c++_course", background: "Background 1", icon: "c++_icon")

var section6 = CourseSection(title: "Управление памятью", subtitle: "11 разделов - 30 часов", text: "Вы научитесь избегать утечек памяти", image: "c++_course", background: "Background 1", icon: "c++_icon")

var section7 = CourseSection(title: "Многопоточность", subtitle: "11 разделов - 30 часов", text: "Вы научитесть писать асинхронный код", image: "c++_course", background: "Background 1", icon: "c++_icon")

var section8 = CourseSection(title: "Пространство имен", subtitle: "11 разделов - 30 часов", text: "Вы научитесь избегать некоторых ошибок при работе с кодом", image: "c++_course", background: "Background 1", icon: "c++_icon")

var section9 = CourseSection(title: "Элегантность кода", subtitle: "11 разделов - 30 часов", text: "Вы научитесь сохранять код в чистоте и порядке", image: "c++_course", background: "Background 1", icon: "c++_icon")

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

var sectionProgramm: [SectionProgramm] = [
    
    SectionProgramm(section: section1, childSections: [section2, section3, section4]),
    SectionProgramm(section: section2, childSections: [section5]),
    SectionProgramm(section: section3, childSections: []),
    SectionProgramm(section: section4, childSections: []),
    SectionProgramm(section: section5, childSections: [section6, section7]),
    SectionProgramm(section: section6, childSections: []),
    SectionProgramm(section: section7, childSections: [section8, section9]),
    SectionProgramm(section: section8, childSections: []),
    SectionProgramm(section: section9, childSections: [])
    
]
