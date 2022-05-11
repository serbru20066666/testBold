import Foundation
import UIKit
import Swinject

class AppCoordinator: Coordinator {
    
    let window: UIWindow
    let container: Container
    
    var currentView: UIViewController? {
        get {
            return window.rootViewController
        }
        set {
            UIView.transition(with: self.window, duration: 0.5, options: .transitionFlipFromBottom, animations: {
                self.window.rootViewController = newValue
            }, completion: nil)
        }
    }
    
    init(window: UIWindow, container: Container) {
        self.window = window
        self.container = container
    }
    
    func start() {
        showSearchView()
    }
    
    func showSearchView() {
        let view = container.resolve(SearchView.self)!
        let service = SearchService()
        let viewModel = SearchViewModel(service: service)
        view.vm = viewModel
        view.delegate = self
        self.currentView = view
    }
    func showDetail(place:Place) {
        let view = container.resolve(DetailVC.self)!
        let service = DetailService()
        let viewModel = DetailViewModel(service: service)
        view.place = place
        view.vm = viewModel
        view.delegate = self
        self.currentView?.present(view, animated: true)
    }
}

extension AppCoordinator: SearchViewDelegate {
    func showDetailView(place:Place) {
        self.showDetail(place: place)
    }
}

extension AppCoordinator: DetailVCDelegate {
    func dismiss() {
        self.currentView?.dismiss(animated: true)
    }
}

/*extension AppCoordinator: OnboardingViewDelegate {
    func nextPage2() {
        //check user Login
        // self.showLoginView()
        self.showMainViewPaso2()
    }
    func nextPage3() {
        //check user Login
        // self.showLoginView()
        self.showMainViewPaso3()
    }
    func Suggestion() {
        //check user Login
        // self.showLoginView()
        self.showSuggestion()
    }
}

extension AppCoordinator: SuggestionViewDelegate {
    func dismiss() {
        self.currentView?.dismiss(animated: true)
    }
}*/

