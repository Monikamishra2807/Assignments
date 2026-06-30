import { Link, Outlet, useNavigate } from "react-router-dom";

export function DashboardLayout()
{
    const navigate = useNavigate();
    const user = JSON.parse(localStorage.getItem("user"));

    function handleLogout()
    {
        localStorage.removeItem("user");
        navigate("/login");
    }
    return(
        <div className="page">
            <h2>Student Dashboard</h2>
            <p>
                Welcome, <strong>{user?.username}</strong>
            </p>
            <div className="dashboard-menu">
                <Link to ="/dashboard" className="button-link">
                  Dashboard
                </Link>

                <Link to ="/dashboard/profile" className="button-link">
                  Profile
                </Link>

                <Link to ="/dashboard/my-courses" className="button-link">
                   My Courses
                </Link>

                <Link to ="/dashboard/settings" className="button-link">
                  Settings
                </Link>
           </div>

           <div className="dashboard-content">
             <Outlet />
           </div>
        </div>
    );
}