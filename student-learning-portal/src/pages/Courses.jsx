import { Link } from "react-router-dom";
import { courses } from "../data/courses";

export function Courses()
{
    return(
        <div className='page'>
            <h1> Available Courses</h1>

            {courses.map((course)=>(
                <div key={course.id} className='course-card'>
                    <h2>{course.title}</h2>
                    <p>
                        <strong>Category:</strong>{course.category}
                    </p>

                     <p>
                        <strong>Duration:</strong>{course.duration}
                    </p>

                     <p>
                        <strong>Trainer:</strong>{course.trainer}
                    </p>

                    <Link to={`/courses/${course.id}`} className="button-link">
                      View Details
                    </Link>
                </div>
            ))}
        </div>
    );
}