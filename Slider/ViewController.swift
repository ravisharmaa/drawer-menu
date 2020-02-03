import UIKit

class ViewController: UIViewController {
    
    var state: Bool = false
    var menuViewleadingConstraint: NSLayoutConstraint?
    var mainViewLeadingConstraint: NSLayoutConstraint?
    
    
    lazy var menuViewController: UIViewController = {
        let vc = MenuTableViewController()
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        
        return vc
    }()
    
    lazy var mainViewController: UIViewController = {
        let mainViewController = MainViewController()
        mainViewController.view.translatesAutoresizingMaskIntoConstraints = false
        return mainViewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.gray
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(toggleMenu))
        
        layoutUI()
    }
    
    func layoutUI() {
        addChild(menuViewController)
        view.addSubview(menuViewController.view)
        menuViewController.didMove(toParent: self)
        
        menuViewleadingConstraint =  menuViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -(view.frame.width - 100))
        
        menuViewleadingConstraint?.isActive = true
        
        NSLayoutConstraint.activate([
            menuViewController.view.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            menuViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            menuViewController.view.widthAnchor.constraint(equalToConstant: view.frame.width - 100)
        ])
        
        addChild(mainViewController)
        view.addSubview(mainViewController.view)
        mainViewController.didMove(toParent: self)

        mainViewController.view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)

        mainViewLeadingConstraint = mainViewController.view.leadingAnchor.constraint(equalTo: menuViewController.view.trailingAnchor)
        mainViewLeadingConstraint?.isActive = true

        NSLayoutConstraint.activate([
            mainViewController.view.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            mainViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainViewController.view.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor)
        ])
    }
    
    @objc func toggleMenu() {
        
        menuViewleadingConstraint?.constant = state ? -(view.frame.width - 100): 0
        
        mainViewLeadingConstraint?.constant = state ? -20: 0
        
        UIView.animate(withDuration: 0.4) { self.view.layoutIfNeeded() }
        
        state = !state
    }
    
    
}

