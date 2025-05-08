import SwiftUI

struct SCHETabView: View {
    var body: some View {
        TabView {
            MainScheduleView()
                .tabItem {
                    Image(systemName: "house")
                    Text("홈")
                }

            CalendarView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("캘린더")
                }

            // 스토어는 나중에
            /*
            StoreView()
                .tabItem {
                    Image(systemName: "cart")
                    Text("스토어")
                }
            */
        }
    }
}

#Preview {
    SCHETabView()
}
