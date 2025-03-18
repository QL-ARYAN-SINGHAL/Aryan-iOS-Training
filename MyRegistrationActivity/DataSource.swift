import UIKit

// Course Model with Description
struct Course {
    let title: String
    let professor: String
    let credits: String
    let time: String
    let location: String
    let description: String  // New field added
}


class CourseRegistrationDataSource: NSObject,UITableViewDataSource {
    
    private(set) var courses: [Course] = [
        Course(
            title: "Media and Gender",
            professor: "Novak, T",
            credits: "3 credits",
            time: "12:15pm - 01:30pm",
            location: "104 BLH",
            description: "This course explores the representation of gender across various forms of media, including television, film, advertising, and digital platforms. Students will critically analyze how media influences societal perceptions of gender roles and identities. The course examines historical and contemporary examples, considering issues such as gender stereotypes, feminism, masculinity, and LGBTQ+ representation. Discussions include media ownership, audience reception, and the impact of cultural narratives. Through case studies, readings, and discussions, students develop critical thinking skills about media messages and their broader implications. By the end of the course, students will be able to assess how gender is constructed and communicated."
        ),
        Course(
            title: "Environmental Geology",
            professor: "Kilgore, S",
            credits: "3 credits",
            time: "08:35am - 09:05am",
            location: "023 SCB",
            description: "This course introduces students to the geological processes that shape the Earth’s environment, with a focus on human interaction with these systems. Topics include natural hazards such as earthquakes, volcanoes, and landslides, as well as the impact of climate change on geological structures. Students will explore sustainable resource management, groundwater contamination, and the role of geology in urban planning. Case studies of environmental disasters will highlight the importance of geological science in decision-making. Through laboratory exercises and field observations, students will gain hands-on experience in analyzing geological formations and understanding their relevance to environmental issues."
        ),
        Course(
            title: "World Civilizations",
            professor: "Chande, A",
            credits: "3 credits",
            time: "10:00am - 10:50am",
            location: "155 NEX",
            description: "This course provides an in-depth exploration of the major civilizations that have shaped world history. It examines political, economic, cultural, and social developments across different regions, including Asia, Africa, Europe, and the Americas. Topics include ancient empires, religious movements, revolutions, colonialism, and globalization. Students will analyze primary and secondary sources to understand historical contexts and perspectives. Discussions will focus on how past civilizations continue to influence modern societies. The course aims to foster an appreciation of historical continuity and change, while also developing students’ analytical and research skills through writing assignments and group projects."
        ),
        Course(
            title: "Introduction to Cybersecurity",
            professor: "Leune, C",
            credits: "3 credits",
            time: "09:25am - 10:40am",
            location: "205 Swirbul Library",
            description: "This course introduces students to the fundamental principles of cybersecurity, including threat identification, risk management, and defense strategies. Topics covered include network security, cryptography, ethical hacking, and data protection. Students will explore real-world case studies of cyber-attacks and analyze security vulnerabilities in different systems. Practical exercises will help students understand how security measures are implemented and tested. The course also addresses legal and ethical considerations in cybersecurity, including privacy concerns and compliance regulations. By the end of the course, students will have a solid understanding of key cybersecurity concepts and be able to assess security risks in digital environments."
        ),
        Course(
            title: "Statistics and Data Analytics",
            professor: "Morales, M",
            credits: "3 credits",
            time: "2:25pm - 3:40pm",
            location: "100 SWL",
            description: "This course provides an introduction to statistical methods and data analytics techniques used in various fields. Topics include probability distributions, hypothesis testing, regression analysis, and data visualization. Students will learn how to interpret and analyze real-world data sets using statistical software. The course emphasizes practical applications, including business decision-making, healthcare analysis, and social science research. Students will complete projects that involve collecting, organizing, and analyzing data to draw meaningful conclusions. By the end of the course, students will have the skills needed to critically evaluate statistical findings and apply data-driven decision-making in professional settings."
        )
    ]



    
    // MARK: - UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
            return UITableViewCell()
        }
        
        let course = courses[indexPath.row]
        cell.config(with: course)
        return cell
    }

}
