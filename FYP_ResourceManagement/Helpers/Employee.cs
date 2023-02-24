using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FYP_ResourceManagement.Helpers
{
    public class Employee
    {
        public int EmployeeID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string DepartmentID { get; set; }
        public string Rate { get; set; }
        public string JobDescription { get; set; }
        public string ProjectsAllocated { get; set; }

        public void Update()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ND_ResourceManagement"].ConnectionString);
            SqlCommand cmd = new SqlCommand("P02004_EMPLOYEE_Update", conn);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            cmd.ExecuteNonQuery();
            conn.Open();
            cmd.Parameters.AddWithValue("@firstName", FirstName);
            cmd.Parameters.AddWithValue("@lastName", LastName);
            cmd.Parameters.AddWithValue("@departmentID", DepartmentID);
            cmd.Parameters.AddWithValue("@rate", Rate);
            cmd.Parameters.AddWithValue("@jobDescription", JobDescription);
            cmd.Parameters.AddWithValue("@projectsAllocated", ProjectsAllocated);
            conn.Close();
            adapter.Dispose();
        }
    }
}