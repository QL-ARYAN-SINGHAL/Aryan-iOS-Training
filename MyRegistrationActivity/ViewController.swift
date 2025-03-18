import UIKit

class ViewController: UIViewController {
    
    let myCourses = CourseRegistrationDataSource() // Data source for courses
    
    private let headingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "MY REGISTRATION"
        label.font = UIFont(name: "Arial-BoldMT", size: 24)
        label.textAlignment = .left
        return label
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
//        tableView.rowHeight = UITableView.automaticDimension
     //   tableView.sectionHeaderHeight = 50
      //  tableView.rowHeight = 150
//        tableView.estimatedRowHeight = 500
        tableView.separatorStyle = .none
     //   tableView.sectionHeaderTopPadding = 15
      //  tableView.sectionFooterHeight = 15
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = myCourses
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.addSubview(headingLabel)
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            headingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            headingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            tableView.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = Openingpage()
        if let navigationController = navigationController {
            navigationController.pushViewController(nextVC, animated: true)
        } else {
            print("⚠️ Warning: navigationController is nil. Ensure ViewController is inside a UINavigationController.")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
