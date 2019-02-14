using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;
using DataAccess;
using Entities;

namespace Logic
{
    public class EmployeeLN
    {
        #region "Singleton Pattern"
        private static EmployeeLN employeeLN = null;
        private EmployeeLN() { }
        public static EmployeeLN getInstance()
        {
            if (employeeLN == null)
            {
                employeeLN = new EmployeeLN();
            }
            return employeeLN;
        }
        #endregion

        public ArrayList initialSearch()
        {
            try
            {
                return EmployeeDAO.getInstance().initialSearch();
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public ArrayList searchCode(string code, string option)
        {
            try
            {
                return EmployeeDAO.getInstance().searchCode(code, option);
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public ArrayList FilterEmployee(string code, string name, string sam, string country, string active)
        {
            try
            {
                return EmployeeDAO.getInstance().FilterEmployee(code, name, sam, country, active);
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public bool InsertEmployee(Employee employee)
        {
            try
            {
                return EmployeeDAO.getInstance().InsertEmployee(employee);
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public bool UpdateEmployee(Employee employee)
        {
            try
            {
                return EmployeeDAO.getInstance().UpdateEmployee(employee);
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public bool DeleteEmployee(string code)
        {
            try
            {
                return EmployeeDAO.getInstance().DeleteEmployee(code);
            }
            catch (Exception e)
            {
                throw e;
            }
        }
    }
}
