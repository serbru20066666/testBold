import Foundation
import Swinject

final class DefaultContainer {
    
    let container: Container
    
    init() {
        self.container = Container()
        self.registerViews()
    }
    
}

//Register Views
extension DefaultContainer {
    
    func registerViews() {
        self.container.register(SearchView.self) { _ in
            SearchView()
        }
        self.container.register(DetailVC.self) { _ in
            DetailVC()
        }
    }
    
}
