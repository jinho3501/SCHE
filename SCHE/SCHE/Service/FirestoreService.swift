import Foundation
import FirebaseFirestore


class FirestoreService: ObservableObject {
    private let db = Firestore.firestore()
    
    @Published var schedules: [Schedule] = []
    
    func fetchSchedules(for uid: String) {
        print("🔥 fetchSchedules 호출됨. uid: \(uid)")
        db.collection("schedules")
            .whereField("ownerUID", isEqualTo: uid)
            .order(by: "date")
            .addSnapshotListener { (snapshot, error) in
                if let error = error {
                    print("스케줄 불러오기 오류: \(error.localizedDescription)")
                    return
                }
                
                let docs = snapshot?.documents ?? []
                print("🔥 가져온 문서 개수: \(docs.count)")
                
                self.schedules = docs.compactMap { doc in
                    try? doc.data(as: Schedule.self)
                }
            }
    }
    
}
