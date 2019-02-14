using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Employee
    {
        public string ID { get; set; }
        public string name { get; set; }
        public string sam { get; set; }
        public string country { get; set; }
        public string active { get; set; }
        public string systemAdmin { get; set; }
        public string email { get; set; }

        public Employee() { }

        public Employee(string ID, string name, string sam, string country, string active, string systemAdmin, string email)
        {
            this.ID = ID;
            this.name = name;
            this.sam = sam;
            this.country = country;
            this.active = active;
            this.systemAdmin = systemAdmin;
            this.email = email;
        }
        
    }
}
