import Foundation
import FirebaseFirestore

struct Schedule: Identifiable, Codable {
    @DocumentID var id: String?  // Firestore 문서 ID
    var title: String
    var date: Date
    var ownerUID: String

    // Firestore 디코딩을 위해 기본 생성자 제공
    init(id: String? = nil, title: String, date: Date, ownerUID: String) {
        self.id = id
        self.title = title
        self.date = date
        self.ownerUID = ownerUID
    }
}
