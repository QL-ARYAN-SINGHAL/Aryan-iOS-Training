import UIKit

class Openingpage: UIViewController {
    
    let myCourses = CourseRegistrationDataSource() // Data source instance
    
    // Image section
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "random")
        return image
    }()
    
    // Separator line
    var lineView: UIView = {
        let lineView = UIView()
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.backgroundColor = UIColor.gray
        return lineView
    }()
    
    // Course Title Label
    var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 17.0)
        label.text = "Course Information"
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    // Course Heading
    var courseHeading: UILabel = {
        let courseHeading = UILabel()
        courseHeading.translatesAutoresizingMaskIntoConstraints = false
        courseHeading.font = UIFont(name: "Arial-BoldMT", size: 23.0)
        courseHeading.textAlignment = .center
        return courseHeading
    }()
    
    // Course Detail (Static Labels)
    var courseDetail: UILabel = {
        let courseDetail = UILabel()
        courseDetail.translatesAutoresizingMaskIntoConstraints = false
        courseDetail.font = UIFont(name: "HelveticaNeue", size: 17.0)
        courseDetail.text = "Professor       Credits       Location"
        courseDetail.textColor = .gray
        courseDetail.numberOfLines = 1
        courseDetail.textAlignment = .center
        return courseDetail
    }()
    
    // Course Detail Values (Dynamic)
    var courseDetailValues: UILabel = {
        let courseDetailValues = UILabel()
        courseDetailValues.translatesAutoresizingMaskIntoConstraints = false
        courseDetailValues.font = UIFont(name: "HelveticaNeue", size: 14.0)
        courseDetailValues.numberOfLines = 1
        courseDetailValues.textAlignment = .center
        return courseDetailValues
    }()
    
    // Course Description Section
    var descriptionSection: UILabel = {
        let descriptionSection = UILabel()
        descriptionSection.translatesAutoresizingMaskIntoConstraints = false
        descriptionSection.numberOfLines = 0
        descriptionSection.font = UIFont(name: "HelveticaNeue", size: 14.0)
        descriptionSection.textAlignment = .justified
        return descriptionSection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
        
        // Set course details dynamically
        if let firstCourse = myCourses.courses.first {
            courseHeading.text = firstCourse.title
            descriptionSection.text = firstCourse.description
            courseDetailValues.text = "\(firstCourse.professor)             \(firstCourse.credits)            \(firstCourse.location)"
        } else {
            courseHeading.text = "No Courses Available"
            descriptionSection.text = ""
            courseDetailValues.text = "No Details Available"
        }
    }
    
    
    private func setupViews() {
        view.addSubview(image)
        view.addSubview(courseHeading)
        view.addSubview(courseDetail)
        view.addSubview(courseDetailValues)
        view.addSubview(lineView)
        view.addSubview(label)
        view.addSubview(descriptionSection)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Image Constraints
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            image.heightAnchor.constraint(equalToConstant: 350),
            
            // Course Heading Constraints
            courseHeading.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
            courseHeading.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            courseHeading.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Course Detail (Static Label)
            courseDetail.topAnchor.constraint(equalTo: courseHeading.bottomAnchor, constant: 10),
            courseDetail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            courseDetail.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Course Detail Values (Dynamic Data)
            courseDetailValues.topAnchor.constraint(equalTo: courseDetail.bottomAnchor, constant: 5),
            courseDetailValues.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            courseDetailValues.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Line View Constraints (Separator)
            lineView.topAnchor.constraint(equalTo: courseDetailValues.bottomAnchor, constant: 15),
            lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            lineView.heightAnchor.constraint(equalToConstant: 2),
            
            // Course Information Label
            label.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Description Constraints
            descriptionSection.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            descriptionSection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionSection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}
