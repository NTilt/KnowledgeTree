//
//  FilterScreen.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 03.04.2023.
//

import SwiftUI

struct FilterScreen: View {
    @EnvironmentObject var universityDocument: UniversityDocument
    @EnvironmentObject var model: AppModel
    @Binding var selectedCourse: String
    @Binding var selectedSort: Sorting
    @Binding var selectedGroup: Int
    var completion: () -> Void
    @Environment(\.dismiss) var dismiss
    private var courses: [String] {
        var courses: [Course] = []
        courses.append(contentsOf: universityDocument.getCoursesForTeacher(teacherEmail: model.email))
        return courses.map { $0.title }
    }
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Курс", selection: $selectedCourse) {
                        ForEach(courses, id: \.self) {
                            Text($0)
                        }
                    }
                }
                .frame(height: 50)
                Section {
                    let groups = universityDocument.getNumberGroups(by: selectedCourse)
                    Picker("Номер группы", selection: $selectedGroup) {
                        ForEach(groups, id: \.self) {
                            Text("\($0)")
                        }
                    }
                }
                .frame(height: 50)
                Section {
                    Picker("Сортировка", selection: $selectedSort) {
                        ForEach(Sorting.allCases, id: \.self) {
                            Text($0.localizedName)
                        }
                    }
                }
                .frame(height: 50)
            }
            Button {
                completion()
                dismiss()
            } label: {
                Text("Применить")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
            }
            .font(.headline)
            .frame(width: 300)
            .blendMode(.overlay)
            .buttonStyle(.filterStyle)
            .tint(.accentColor)
            .controlSize(.large)
            .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
        }
    }
}

enum Sorting: String, Equatable, CaseIterable {
    case bySecondName  = "По фамилии"
    case byRating = "По баллам"

    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}

struct FilterScreen_Previews: PreviewProvider {
    static var previews: some View {
        FilterScreen(selectedCourse: .constant("SwiftUI"), selectedSort: .constant(.bySecondName), selectedGroup: .constant(441), completion: {print("Student")})
            .environmentObject(UniversityDocument())
            .environmentObject(AppModel())
    }
}
