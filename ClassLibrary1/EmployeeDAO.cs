using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;
using System.Data.SqlClient;
using System.Data;
using System.Collections;

namespace DataAccess
{
    public class EmployeeDAO
    {
        #region "Singleton Pattern"
        private static EmployeeDAO employeeDAO = null;
        private EmployeeDAO() { }
        public static EmployeeDAO getInstance()
        {
            if(employeeDAO == null)
            {
                employeeDAO = new EmployeeDAO();
            }
            return employeeDAO;
        }
        #endregion

        public ArrayList initialSearch()
        {
            SqlConnection connection = null;
            SqlCommand cmd = null;
            Employee employee = null;
            ArrayList employees = new ArrayList();
            SqlDataReader dr = null;
            try
            {
                connection = Connection.getInstance().DBConnect();
                cmd = new SqlCommand("SELECT * FROM dbo.Employee", connection);
                cmd.CommandType = CommandType.Text;
                connection.Open();
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    employee = new Employee();
                    employee.ID = dr["k_employee"].ToString();
                    employee.name = dr["n_employee"].ToString();
                    employee.sam = dr["o_sam_employee"].ToString();
                    employee.country = dr["o_country"].ToString();
                    employee.active = dr["i_active"].ToString();
                    employee.systemAdmin = dr["i_system_administrator"].ToString();
                    employees.Add(employee);
                }
            }
            catch (Exception e)
            {
                employees = null;
                throw e;
            }
            finally
            {
                connection.Close();
            }
            return employees;
        }

        public ArrayList searchCode(string code, string option)
        {
            SqlConnection connection = null;
            SqlCommand cmd = null;
            Employee employee = null;
            ArrayList employees = new ArrayList();
            SqlDataReader dr = null;
            try
            {
                connection = Connection.getInstance().DBConnect();
                cmd = new SqlCommand("spSearchCode", connection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@code", code);
                if (option == "1")
                {
                    cmd.Parameters.AddWithValue("@coder", code );
                }
                else
                {
                    cmd.Parameters.AddWithValue("@coder", code + "%");
                }
                
                connection.Open();
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    employee = new Employee();
                    employee.ID = dr["k_employee"].ToString();
                    employee.name = dr["n_employee"].ToString();
                    employee.sam = dr["o_sam_employee"].ToString();
                    employee.country = dr["o_country"].ToString();
                    employee.active = dr["i_active"].ToString();
                    employee.systemAdmin = dr["i_system_administrator"].ToString();
                    employee.email = dr["o_email_employee"].ToString();
                    employees.Add(employee);
                }
            }
            catch (Exception e)
            {
                employees = null;
                throw e;
            }
            finally
            {
                connection.Close();
            }
            return employees;
        }

        public ArrayList FilterEmployee(string code, string name, string sam, string country, string active)
        {
            SqlConnection connection = null;
            SqlCommand cmd = null;
            Employee employee = null;
            ArrayList employees = new ArrayList();
            SqlDataReader dr = null;
            try
            {
                string query = "select * from Employee where k_employee <> 0";
                if (code != "")
                {
                    query += " and k_employee like @code";
                }
                if (name != "")
                {
                    query += " and n_employee like @name";
                }
                if (sam != "")
                {
                    query += " and o_sam_employee like @sam";
                }
                if (country != "")
                {
                    query += " and o_country = @country";
                }
                if (active != "")
                {
                    query += " and i_active = @active";
                }
                connection = Connection.getInstance().DBConnect();
                cmd = new SqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@code", code + "%");
                cmd.Parameters.AddWithValue("@name", "%" + name + "%");
                cmd.Parameters.AddWithValue("@sam", "%" + sam + "%");
                cmd.Parameters.AddWithValue("@country", country);
                cmd.Parameters.AddWithValue("@active", active);
                connection.Open();
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    employee = new Employee();
                    employee.ID = dr["k_employee"].ToString();
                    employee.name = dr["n_employee"].ToString();
                    employee.sam = dr["o_sam_employee"].ToString();
                    employee.country = dr["o_country"].ToString();
                    employee.active = dr["i_active"].ToString();
                    employee.systemAdmin = dr["i_system_administrator"].ToString();
                    employee.email = dr["o_email_employee"].ToString();
                    employees.Add(employee);
                }
            }
            catch (Exception e)
            {
                employees = null;
                throw e;
            }
            finally
            {
                connection.Close();
            }
            return employees;
        }

        public bool InsertEmployee(Employee employee)
        {
            SqlConnection connection = null;
            SqlCommand cmd = null;
            bool error = false;

            try
            {
                connection = Connection.getInstance().DBConnect();
                cmd = new SqlCommand("spInsertEmployee", connection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@code", employee.ID);
                cmd.Parameters.AddWithValue("@name", employee.name);
                cmd.Parameters.AddWithValue("@sam", employee.sam);
                cmd.Parameters.AddWithValue("@country", employee.country);
                cmd.Parameters.AddWithValue("@active", employee.active);
                cmd.Parameters.AddWithValue("@systemAdmin", employee.systemAdmin);
                cmd.Parameters.AddWithValue("@email", employee.email);
                connection.Open();
                int result = cmd.ExecuteNonQuery();
                if (result == 0) error = true;
            }
            catch (Exception e)
            {
                error = true;
                throw e;
            }
            finally
            {
                connection.Close();
            }
            return error;
        }

        public bool UpdateEmployee(Employee employee)
        {
            SqlConnection connection = null;
            SqlCommand cmd = null;
            bool error = false;

            try
            {
                connection = Connection.getInstance().DBConnect();
                cmd = new SqlCommand("spUpdateEmployee", connection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@code", employee.ID);
                cmd.Parameters.AddWithValue("@name", employee.name);
                cmd.Parameters.AddWithValue("@sam", employee.sam);
                cmd.Parameters.AddWithValue("@country", employee.country);
                cmd.Parameters.AddWithValue("@active", employee.active);
                cmd.Parameters.AddWithValue("@systemAdmin", employee.systemAdmin);
                cmd.Parameters.AddWithValue("@email", employee.email);
                connection.Open();
                int result = cmd.ExecuteNonQuery();
                if (result == 0) error = true;
            }
            catch (Exception e)
            {
                error = true;
                throw e;
            }
            finally
            {
                connection.Close();
            }
            return error;
        }

        public bool DeleteEmployee(string code)
        {
            SqlConnection connection = null;
            SqlCommand cmd = null;
            bool error = false;

            try
            {
                connection = Connection.getInstance().DBConnect();
                cmd = new SqlCommand("spDeleteEmployee", connection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@code", code);
                connection.Open();
                int result = cmd.ExecuteNonQuery();
                if (result == 0) error = true; 
            }
            catch (Exception e)
            {
                error = true;
                throw e;
            }
            finally
            {
                connection.Close();
            }
            return error;
        }
    }
}
