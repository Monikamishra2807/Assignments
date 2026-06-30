import { useParams, useNavigate} from 'react-router-dom';
import { courses } from '../data/courses';

export function CourseDetails()
{
    const { courseId } = useParams();
    const navigate = useNavigate();

    const course = courses.find(
        (course) => course.id === Number(courseId)
    );

    if(!course)
    {
        return(
            <div className='page'>
                <h2>Course Not Found</h2>
            </div>
        );
    }

    return(
        <div className='page'>
            <h1>Course Details</h1>

            <p>
                <strong>Course ID:</strong> {course.id}
            </p>

            <p>
                <strong>Title:</strong> {course.title}
            </p>

            <p>
                <strong>Category:</strong> {course.category}
            </p>

            <p>
                <strong>Duration:</strong> {course.duration}
            </p>

            <p>
                <strong>Description:</strong> {course.description}
            </p>

            <button onClick={()=> navigate("/courses")}>
                Back to Courses
            </button>
        </div>
    );
}