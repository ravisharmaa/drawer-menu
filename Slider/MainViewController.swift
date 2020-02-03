import UIKit

class MainViewController: UIViewController {
    
    lazy var profileLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(profileLabel)
        
        profileLabel.text = "Open Profile"
        
        profileLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        NSLayoutConstraint.activate([
            profileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            profileLabel.heightAnchor.constraint(equalToConstant: 25),
            profileLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 50)
        ])
    }
}
