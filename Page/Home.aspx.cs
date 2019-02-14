using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entities;
using Logic;
using System.Collections;

namespace Page
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        [System.Web.Services.WebMethod]
        public static ArrayList SearchCode(string srchInput, string option)
        {
            ArrayList employees = new ArrayList();
            employees = EmployeeLN.getInstance().searchCode(srchInput, option);
            return employees;
        }

        [System.Web.Services.WebMethod]
        public static ArrayList InitialSearch()
        {
            ArrayList employees = new ArrayList();
            employees = EmployeeLN.getInstance().initialSearch();
            return employees;
        }

        [System.Web.Services.WebMethod]
        public static bool InsertEmployee(string code, string name, string lastName, string sam, string country, string active, string systemAdmin, string email)
        {
            string fullName = name+ " " + lastName;
            Employee employee = new Employee(code, fullName,sam,country,active,systemAdmin,email);
            return EmployeeLN.getInstance().InsertEmployee(employee);
        }

        [System.Web.Services.WebMethod]
        public static bool DeleteEmployee(string code)
        {
            return EmployeeLN.getInstance().DeleteEmployee(code);
        }

        [System.Web.Services.WebMethod]
        public static bool UpdateEmployee(string code, string name, string lastName, string sam, string country, string active, string systemAdmin, string email)
        {
            string fullName = name + " " + lastName;
            Employee employee = new Employee(code, fullName, sam, country, active, systemAdmin, email);
            return EmployeeLN.getInstance().UpdateEmployee(employee);
        }

        [System.Web.Services.WebMethod]
        public static ArrayList FilterEmployee(string code, string country, string sam, string name, string active)
        {
            return EmployeeLN.getInstance().FilterEmployee(code,name, sam, country, active);
        }
    }
}