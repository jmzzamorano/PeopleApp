
import Foundation
import Swinject

final class DashboardViewConfigurator {
    private let container = AppConfig.shared.container
    
    func controller() -> DashboardViewController {
        let getUsers = container.resolve(GetUsers.self)!
        var dashboardWireframe = container.resolve(DashboardWireframe.self)!

        let controller = DashboardViewController()
        dashboardWireframe.parent = controller
        controller.cellFactory = getCellFactory()
        
        let presenter = DashboardPresenterDefault(
            getUsers: getUsers,
            wireframe: dashboardWireframe
        )
        
        controller.presenter = presenter
        presenter.view = controller
        
        return controller
    }
    
    private func getCellFactory() -> DashboardCellFactory {
        var cellFactory = container.resolve(DashboardCellFactory.self)!
        cellFactory.cellTypes = [
            .medium: MediumCellView(),
            .banner: BannerCellView(),
            .date: DateCellView()
        ]
        
        return cellFactory
    }
}
