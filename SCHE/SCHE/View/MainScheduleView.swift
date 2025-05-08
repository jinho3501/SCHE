import SwiftUI
import FirebaseAuth

struct MainScheduleView: View {
    @StateObject private var firestoreService = FirestoreService()

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {

                // 상단 Today 헤더
                Text("Today")
                    .font(.title2)
                    .bold()
                    .padding(.leading)

                // 스케줄 리스트
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(firestoreService.schedules) { schedule in
                            ScheduleRow(schedule: schedule)
                        }
                    }
                    .padding(.horizontal)
                }

                Spacer()

                // + 버튼
                HStack {
                    Spacer()
                    Button(action: {
                        // TODO: 추가 화면 띄우기
                    }) {
                        Image(systemName: "plus")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.gray)
                            .clipShape(Circle())
                    }
                    .padding(.trailing)
                }

            }
            .navigationTitle("SCHE")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("로그아웃") {
                        logout()
                    }
                }
            }
            .onAppear {
                if let uid = Auth.auth().currentUser?.uid {
                    firestoreService.fetchSchedules(for: uid)
                }
            }
        }
    }

    private func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("로그아웃 실패: \(error.localizedDescription)")
        }
    }
}

// 스케줄 박스 디자인 (체크박스 포함)
struct ScheduleRow: View {
    var schedule: Schedule
    @State private var isChecked = false  // 나중에 Firestore와 연동 가능

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(schedule.title)
                    .font(.headline)
                    .foregroundColor(.black)
                Text(schedule.date, style: .date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Button(action: {
                isChecked.toggle()
            }) {
                Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                    .foregroundColor(isChecked ? .green : .gray)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}

#Preview {
    MainScheduleView()
}
