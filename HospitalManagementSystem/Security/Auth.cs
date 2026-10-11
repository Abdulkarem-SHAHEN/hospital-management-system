using System;
using System.Web;
using System.Web.SessionState;

namespace HospitalManagementSystem
{
    /// <summary>
    /// Login state of the current user. The id and the role are kept in the server-side
    /// session, so the browser only holds the session id and cannot change them.
    /// </summary>
    public static class Auth
    {
        private const string IdKey = "UserId";
        private const string RoleKey = "UserRole";

        private static HttpSessionState Session
        {
            get { return HttpContext.Current.Session; }
        }

        public static bool IsLoggedIn
        {
            get { return Session != null && Session[IdKey] != null && Session[RoleKey] != null; }
        }

        /// <summary>Id of the user in the table of their role. Only valid when IsLoggedIn is true.</summary>
        public static int UserId
        {
            get { return (int)Session[IdKey]; }
        }

        /// <summary>"t" top management, "p" patient, "d" doctor, "s" staff; null when not logged in.</summary>
        public static string Role
        {
            get { return IsLoggedIn ? (string)Session[RoleKey] : null; }
        }

        public static void SignIn(int id, string role)
        {
            Session[IdKey] = id;
            Session[RoleKey] = role;
        }

        public static void SignOut()
        {
            Session.Clear();
            Session.Abandon();

            // the next visit starts with a new session id
            HttpCookie sessionCookie = new HttpCookie("ASP.NET_SessionId", "");
            sessionCookie.Expires = DateTime.Now.AddDays(-1);
            HttpContext.Current.Response.Cookies.Add(sessionCookie);
        }

        public static string HomePageFor(string role)
        {
            switch (role)
            {
                case "t": return "~/adminHomePage.aspx";
                case "p": return "~/patientHomePage.aspx";
                case "d": return "~/doctorHomePage.aspx";
                case "s": return "~/staffHomePage.aspx";
                default: return "~/login.aspx";
            }
        }

        /// <summary>
        /// Call first in Page_Load. A visitor who is not logged in is sent to the login page and a
        /// user with another role to their own home page. Response.Redirect ends the request, so
        /// nothing else on the page runs, including the button handlers of a postback.
        /// </summary>
        public static void RequireRole(string role)
        {
            HttpResponse response = HttpContext.Current.Response;
            if (!IsLoggedIn)
            {
                response.Redirect("~/login.aspx");
            }
            else if (Role != role)
            {
                response.Redirect(HomePageFor(Role));
            }
        }
    }
}
