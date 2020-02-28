import 'entities/course/BaseCourseData.dart';
import 'entities/course/CourseDifficulty.dart';
import 'entities/course/PassedCourseData.dart';
import 'entities/course/PredictedCourse.dart';
import 'entities/course/SuggestedCourseData.dart';
import 'entities/user/SchoolData.dart';
import 'entities/user/SemesterData.dart';
import 'entities/user/UserData.dart';

class DataFetcher {
  static List<PredictedCourse> fetchPredictedCourses() {
    // To be implemented for data fetching
    return new List();
  }

  static UserData fetchUserData() {
    // To be implemented for data fetching
    return new UserData(
        estYear: null,
        schoolData: null,
        favSubjects: null,
        favTeachers: null,
        semesterDataList: null);
  }

  static List<SuggestedCourseData> fetchSuggestedCourses() {
    // To be implemented for data fetching
    return new List();
  }

  static Future<bool> uploadGrades(String filePath) {
    return Future.value(true); // TODO send to server
  }

  static List<PredictedCourse> fetchDefaultPredictedCourses() {
    return <PredictedCourse>[
      PredictedCourse(
          courseCode: "NC0-01-01",
          courseName: "Introduction to Computer Science",
          courseTeacher: "Thrasivoulos Tsiatsos",
          gradePrediction: 10,
          difficulty: CourseDifficulty.EASY,
          gradePercentage: 20,
          enrolledStudents: 150,
          box1: 20,
          box2: 20,
          box3: 20,
          box4: 20,
          box5: 50,
          box6: 20,
          box7: 20,
          box8: 20,
          box9: 20,
          box10: 20),
      PredictedCourse(
          courseCode: "NC0-01-02",
          courseName: "Linear Algebra",
          courseTeacher: "Konstantinos Draziotis",
          gradePrediction: 10,
          difficulty: CourseDifficulty.EASY,
          gradePercentage: 40,
          enrolledStudents: 150,
          box1: 20,
          box2: 20,
          box3: 20,
          box4: 20,
          box5: 50,
          box6: 20,
          box7: 20,
          box8: 20,
          box9: 20,
          box10: 20)
    ];
  }

  static UserData fetchDefaultUserData() {
    return UserData(
      name: 'Test Subject',
      schoolData: SchoolData(
        department: 'Computer Science',
        semester: 5,
      ),
      estYear: 2021,
      favSubjects: <String>[
        "astronomy",
        "object oriented programming",
        "linear algebra",
        "data structures",
      ],
      favTeachers: <String>[
        "mr bean",
        "the janitor",
      ],
      semesterDataList: <SemesterData>[
        SemesterData(
          id: 1,
          courseDataList: <PassedCourseData>[
            PassedCourseData(
              baseData: BaseCourseData(
                title: 'My course title',
                code: 'ABC-01-234',
                teacher: 'John Smith',
                averageGrade: 9.9,
                difficulty: CourseDifficulty.EASY,
              ),
              grade: 9,
              year: '2013-2014',
            ),
            PassedCourseData(
              baseData: BaseCourseData(
                title: 'Some subject',
                code: 'ABC-91-114',
                teacher: 'Dr Jeff',
                averageGrade: 7.5,
                difficulty: CourseDifficulty.MEDIUM,
              ),
              grade: 10,
              year: '2013-2014',
            ),
          ],
        ),
        SemesterData(
          id: 2,
          courseDataList: <PassedCourseData>[
            PassedCourseData(
              baseData: BaseCourseData(
                title: 'My new course title',
                code: 'XYZ-01-234',
                teacher: 'Hello World',
                averageGrade: 4.5,
                difficulty: CourseDifficulty.HARD,
              ),
              grade: 2,
              year: '2013-2014',
            ),
          ],
        ),
      ],
    );
  }

  static List<SuggestedCourseData> fetchDefaultSuggestedCourses() {
    return <SuggestedCourseData>[
      SuggestedCourseData(
        baseData: BaseCourseData(
          title: 'Foundations of Cryptography',
          code: 'NGE-06-03',
          teacher: 'Konstantinos Draziotis',
          averageGrade: 8,
          difficulty: CourseDifficulty.MEDIUM,
        ),
        match: 85,
        favTeacher: true,
      ),
      SuggestedCourseData(
        baseData: BaseCourseData(
          title: 'Mobile Device Interfaces',
          code: 'NET-06-01',
          teacher: 'Thrasyvoulos Tsiatsos',
          averageGrade: 9.5,
          difficulty: CourseDifficulty.EASY,
        ),
        match: 65,
      ),
      SuggestedCourseData(
        baseData: BaseCourseData(
          title: 'Computer Graphics',
          code: 'NDM-07-04',
          teacher: 'Nikos Nikolaidis',
          averageGrade: 7,
          difficulty: CourseDifficulty.HARD,
        ),
        match: 55,
      ),
    ];
  }
}
