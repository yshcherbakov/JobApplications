//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace JobApplications.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class Application
    {
        public Application()
        {
            this.Qualifications = new HashSet<Qualification>();
        }
    
        public int ID { get; set; }
        public string ApplicantName { get; set; }
        public System.DateTime CreatedDateTime { get; set; }
        public int CreatedByUser { get; set; }
        public Nullable<System.DateTime> SubmittedDateTime { get; set; }
    
        public virtual ICollection<Qualification> Qualifications { get; set; }
    }
}
