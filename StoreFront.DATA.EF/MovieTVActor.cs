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
    
    public partial class MovieTVActor
    {
        public int MovieTVActorID { get; set; }
        public int MovieTVID { get; set; }
        public int ActorID { get; set; }
        public Nullable<byte> ActorOrder { get; set; }
        public string Character { get; set; }
    
        public virtual Actor Actor { get; set; }
        public virtual MoviesTV MoviesTV { get; set; }
    }
}
