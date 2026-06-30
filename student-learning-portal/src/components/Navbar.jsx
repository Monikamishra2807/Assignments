import { useState } from "react";
import { NavLink,useNavigate } from 'react-router-dom';

export function Navbar()
{
    const navigate = useNavigate();
    const user = JSON.parse(localStorage.getItem("user"));

    function getNavClass({isActive})
    {
        return isActive ? "nav-link active-link" : "nav-link";
    }

    function handleLogout() {
    localStorage.removeItem("user");
    navigate("/login");
  }
  const [darkMode, setDarkMode] = useState(true);

function toggleTheme() {
  setDarkMode(!darkMode);

  if (darkMode) {
    document.body.classList.add("light-theme");
    document.body.classList.remove("dark-theme");
  } else {
    document.body.classList.add("dark-theme");
    document.body.classList.remove("light-theme");
  }
   setDarkMode(!darkMode);
}
    return(
        <nav className='navbar'>
            <h2 className='logo'>Student Learning Portal</h2>
            <div className='nav-links'>
                <NavLink to="/"className={getNavClass} end>
                  Home
                </NavLink>

                <NavLink to="/courses"className={getNavClass} end>
                  Courses
                </NavLink>

                <NavLink to="/about"className={getNavClass} end>
                  About
                </NavLink>

                <NavLink to="/contact"className={getNavClass} end>
                  Contact
                </NavLink>
                <button className="theme-btn" onClick={toggleTheme}>
                  {darkMode ? "☀" : "🌙 "}
                </button>

                {!user ? (
                    <NavLink to="/login"className={getNavClass} end>
                   Login
                </NavLink>
                ) : (
                <>
                     <NavLink to="/dashboard" className={getNavClass}>
                    Dashboard
                 </NavLink>

                 <button onClick={handleLogout} className="logout-btn">
                  Logout
                   </button>
                </>

                )} 
            </div>
        </nav>
    );
}