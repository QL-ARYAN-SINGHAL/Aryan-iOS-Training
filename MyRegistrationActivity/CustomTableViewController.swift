import UIKit

class CustomCell: UITableViewCell {
    
    static let identifier = "CustomCell"
    
    private let heading: UILabel = {
        let heading = UILabel()
        heading.translatesAutoresizingMaskIntoConstraints = false
        heading.textColor = .black
        heading.font = .boldSystemFont(ofSize: 18)
        return heading
    }()
    
    private let professor: UILabel = {
        let professor = UILabel()
        professor.textColor = .darkGray
        professor.textAlignment = .left
        professor.font = .systemFont(ofSize: 14, weight: .medium)
        professor.numberOfLines = 0
        professor.translatesAutoresizingMaskIntoConstraints = false
        return professor
    }()
    
    private let courseTime: UILabel = {
        let courseTime = UILabel()
        courseTime.textColor = .darkGray
        courseTime.textAlignment = .left
        courseTime.font = .systemFont(ofSize: 14, weight: .medium)
        courseTime.numberOfLines = 0
        courseTime.translatesAutoresizingMaskIntoConstraints = false
        return courseTime
    }()
    
    private let credits: UILabel = {
        let credits = UILabel()
        credits.textColor = .darkGray
        credits.textAlignment = .left
        credits.font = .systemFont(ofSize: 14, weight: .medium)
        credits.numberOfLines = 0
        credits.translatesAutoresizingMaskIntoConstraints = false
        return credits
    }()
    
    private let location: UILabel = {
        let location = UILabel()
        location.textColor = .darkGray
        location.textAlignment = .left
        location.font = .systemFont(ofSize: 14, weight: .medium)
        location.numberOfLines = 0
        location.translatesAutoresizingMaskIntoConstraints = false
        return location
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
      
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func config(with course: Course) {
        self.heading.text = course.title
        self.professor.text = "\(course.professor)"
        self.courseTime.text = "\(course.time)"
        self.credits.text = "\(course.credits)"
        self.location.text = "\(course.location)"
    }
    
    private func setupUI() {
        let customView = UIView()
        customView.backgroundColor = .white  // Set background color for visibility
                customView.translatesAutoresizingMaskIntoConstraints = false  // Enable Auto Layout
                
                // Add to main view
        self.contentView.addSubview(customView)
                
                // Set constraints with padding
                NSLayoutConstraint.activate([
                    customView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20), // Left padding
                    customView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20), // Right padding
                    customView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20), // Top padding
                    customView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
                ])
        customView.addSubview(heading)
        customView.addSubview(professor)
        customView.addSubview(courseTime)
        customView.addSubview(credits)
        customView.addSubview(location)
        
        NSLayoutConstraint.activate([
            // Heading constraints
            heading.topAnchor.constraint(equalTo: customView.topAnchor, constant: 10),
            heading.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 16),
            heading.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -16),
            
            // Professor and CourseTime side by side
            professor.topAnchor.constraint(equalTo: heading.bottomAnchor, constant: 4),
            professor.leadingAnchor.constraint(equalTo: heading.leadingAnchor),
            professor.trailingAnchor.constraint(equalTo: customView.centerXAnchor, constant: -8),
            
            courseTime.topAnchor.constraint(equalTo: heading.bottomAnchor, constant: 4),
            courseTime.leadingAnchor.constraint(equalTo: customView.centerXAnchor, constant: 8),
            courseTime.trailingAnchor.constraint(equalTo: heading.trailingAnchor),
            
            // Credits and Location side by side
            credits.topAnchor.constraint(equalTo: professor.bottomAnchor, constant: 4),
            credits.leadingAnchor.constraint(equalTo: heading.leadingAnchor),
            credits.trailingAnchor.constraint(equalTo: customView.centerXAnchor, constant: -8),
            
            location.topAnchor.constraint(equalTo: courseTime.bottomAnchor, constant: 4),
            location.leadingAnchor.constraint(equalTo: customView.centerXAnchor, constant: 8),
            location.trailingAnchor.constraint(equalTo: heading.trailingAnchor),
            
            // Add extra bottom padding for spacing
            credits.bottomAnchor.constraint(equalTo: customView.bottomAnchor, constant: -20),
            location.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -37)
        ])
        
     
       // customView.backgroundColor = .clear
        customView.layer.cornerRadius = 12
        customView.layer.masksToBounds = true
        customView.layer.shadowColor = UIColor.gray.cgColor
        customView.layer.shadowOpacity = 0.3
        customView.layer.shadowOffset = CGSize(width: 0, height: 2)
        customView.layer.shadowRadius = 4
        customView.layer.masksToBounds = false
        self.contentView.backgroundColor = .white
    }
}
