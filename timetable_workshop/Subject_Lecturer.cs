//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace timetable_workshop
{
    using System;
    using System.Collections.Generic;
    
    public partial class Subject_Lecturer
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Subject_Lecturer()
        {
            this.Slots = new HashSet<Slot>();
        }
    
        public int ID { get; set; }
        public Nullable<int> Course_Sub_ID { get; set; }
        public Nullable<int> Lect_ID { get; set; }
        public Nullable<int> Type_ID { get; set; }
    
        public virtual Course_Subject Course_Subject { get; set; }
        public virtual Lecturer Lecturer { get; set; }
        public virtual Type Type { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Slot> Slots { get; set; }
    }
}
