//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace StoreFront.DATA.EF
{
    using System;
    using System.Collections.Generic;
    
    public partial class MovieTVDirector
    {
        public int MovieTVDirectorID { get; set; }
        public int MovieTVID { get; set; }
        public int DirectorID { get; set; }
        public Nullable<byte> DirectorOrder { get; set; }
    
        public virtual Director Director { get; set; }
        public virtual MoviesTV MoviesTV { get; set; }
    }
}
