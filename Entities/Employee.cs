using System;

namespace Entities
{
    public class Employee
    {
        private string ID { get; set; }
        private string name { get; set; }
        private string sam { get; set; }
        private string country { get; set; }
        private string active { get; set; }
        private string systemAdmin { get; set; }

        public Employee() { }

        public Employee(string ID, string name, string sam, string country, string active, string systemAdmin)
        {
            this.ID = ID;
            this.name = name;
            this.sam = sam;
            this.country = country;
            this.active = active;
            this.systemAdmin = systemAdmin;
        }
    }
}
