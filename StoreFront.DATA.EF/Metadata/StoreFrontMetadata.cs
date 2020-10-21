using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace StoreFront.DATA.EF//.Metadata
{
    #region Actor Metadata
    public class ActorMetadata
    {
        [Display(Name = "Actor ID")]
        public int ActorID { get; set; }

        [Required(ErrorMessage = "* First Name is required")]
        [StringLength(25, ErrorMessage = "* First Name cannot be longer than 25 characters")]
        [Display(Name = "First Name")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "* Last Name is required")]
        [StringLength(25, ErrorMessage = "* Last Name cannot be longer than 25 characters")]
        [Display(Name = "Last Name")]
        public string LastName { get; set; }

        [StringLength(50, ErrorMessage = "* Country cannot be longer than 50 characters")]
        [DisplayFormat(NullDisplayText = "N/A")]
        public string Country { get; set; }
    }

    [MetadataType(typeof(ActorMetadata))]
    public partial class Actor
    {
        [Display(Name = "Actor Name")]
        public string FullName { get { return FirstName + " " + LastName; } }
    }
    #endregion

    #region Director Metadata
    public class DirectorMetadata
    {
        [Display(Name = "Director ID")]
        public int DirectorID { get; set; }

        [Required(ErrorMessage = "* First Name is required")]
        [StringLength(25, ErrorMessage = "* First Name cannot be longer than 25 characters")]
        [Display(Name = "First Name")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "* Last Name is required")]
        [StringLength(25, ErrorMessage = "* Last Name cannot be longer than 25 characters")]
        [Display(Name = "Last Name")]
        public string LastName { get; set; }

        [StringLength(50, ErrorMessage = "* Country cannot be longer than 50 characters")]
        [DisplayFormat(NullDisplayText = "N/A")]
        public string Country { get; set; }
    }

    [MetadataType(typeof(DirectorMetadata))]
    public partial class Director
    {
        [Display(Name = "Director Name")]
        public string FullName { get { return FirstName + " " + LastName; } }
    }
    #endregion

    #region DiscType Metadata
    public class DiscTypeMetadata
    {
        [Display(Name = "Disc Type")]
        public int DiscTypeID { get; set; }

        [Required(ErrorMessage = "* Disc Type is required")]
        [StringLength(3, ErrorMessage = "* Disc Type cannot be longer than 3 characters")]
        [Display(Name = "Disc Type")]
        public string DiscTypeName { get; set; }
    }

    [MetadataType(typeof(DiscTypeMetadata))]
    public partial class DiscType
    {

    }
    #endregion

    #region Genre Metadata
    public class GenreMetadata
    {
        [Display(Name = "Genre")]
        public int GenreID { get; set; }

        [Required(ErrorMessage = "* Genre is required")]
        [StringLength(50, ErrorMessage = "* Genre cannot be longer than 50 characters")]
        [Display(Name = "Genre")]
        public string GenreName { get; set; }
    }

    [MetadataType(typeof(GenreMetadata))]
    public partial class Genre
    {

    }
    #endregion

    #region MoviesTV Metadata
    public class MoviesTVMetadata
    {
        [Display(Name = "Movie/TV ID")]
        public int MovieTVID { get; set; }

        [Required(ErrorMessage = "* Disc Type ID is required")]
        [Display(Name = "Disc Type ID")]
        public int DiscTypeID { get; set; }

        [Required(ErrorMessage = "* Region Code is required")]
        [Display(Name = "Region Code")]
        public string RegionCodeID { get; set; }

        [StringLength(12, ErrorMessage = "* UPC cannot be longer than 12 characters")]
        [DisplayFormat(NullDisplayText = "N/A")]
        public string UPC { get; set; }

        [Required(ErrorMessage = "* Title Type ID is required")]
        [Display(Name = "Title Type ID")]
        public int TitleTypeID { get; set; }

        [Required(ErrorMessage = "* Title is required")]
        [StringLength(100, ErrorMessage = "* Title cannot be longer than 100 characters")]
        [UIHint("MultilineText")]
        public string Title { get; set; }

        [DisplayFormat(NullDisplayText = "N/A")]
        [UIHint("MultilineText")]
        public string Description { get; set; }

        [DisplayFormat(NullDisplayText = "N/A")]
        [Display(Name = "Genre ID")]
        public Nullable<int> GenreID { get; set; }

        [DisplayFormat(NullDisplayText = "N/A")]
        public Nullable<int> Runtime { get; set; }

        [Required(ErrorMessage = "* MPAA Rating is required")]
        [Display(Name = "MPAA Rating ID")]
        public int MPAARatingID { get; set; }

        [DisplayFormat(NullDisplayText = "N/A", DataFormatString = "{0:c}")]
        [Range(0, double.MaxValue, ErrorMessage = "* Price must be a valid number 0 or larger")]
        public Nullable<decimal> Price { get; set; }

        [DisplayFormat(NullDisplayText = "N/A")]
        [Range(0, double.MaxValue, ErrorMessage = "* Units Sold must be a valid number 0 or larger")]
        [Display(Name = "Units Sold")]
        public Nullable<int> UnitsSold { get; set; }

        [DisplayFormat(NullDisplayText = "N/A", DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        [Display(Name = "Release Date")]
        public Nullable<System.DateTime> ReleaseDate { get; set; }

        [Required(ErrorMessage = "* Studio ID is required")]
        [Display(Name = "Studio ID")]
        public int StudioID { get; set; }

        [Display(Name = "Image")]
        public string TitleImage { get; set; }

        [Display(Name = "Site Feature")]
        public bool IsSiteFeature { get; set; }

        [Display(Name = "On Sale")]
        public bool IsOnSaleFeature { get; set; }

        [Required(ErrorMessage = "* Title Status ID is required")]
        [Display(Name = "Title Status ID")]
        public int TitleStatusID { get; set; }
    }

    [MetadataType(typeof(MoviesTVMetadata))]
    public partial class MoviesTV
    {
        [Display(Name = "Sale Price")]
        public decimal SalePrice
        {
            get
            {
                if (IsOnSaleFeature == true)
                {
                    return Convert.ToDecimal(Price * .8m);
                }
                else
                {
                    return Convert.ToDecimal(Price);
                };
            }
        }
    }
    #endregion

    #region MovieTVActor Metadata
    public class MovieTVActorMetadata
    {
        [Display(Name = "Movie/TV Actor ID")]
        public int MovieTVActorID { get; set; }

        [Required(ErrorMessage = "* Movie/TV ID is required")]
        [Display(Name = "Movie/TV ID")]
        public int MovieTVID { get; set; }

        [Required(ErrorMessage = "* Actor ID is required")]
        [Display(Name = "Actor ID")]
        public int ActorID { get; set; }

        [DisplayFormat(NullDisplayText = "N/A")]
        [Display(Name = "Actor Order")]
        public Nullable<byte> ActorOrder { get; set; }

        [Required(ErrorMessage = "* Character is required")]
        [StringLength(50, ErrorMessage = "* Character cannot be longer than 50 characters")]
        public string Character { get; set; }
    }

    [MetadataType(typeof(MovieTVActorMetadata))]
    public partial class MovieTVActor
    {

    }
    #endregion

    #region MovieTVDirector Metadata
    public class MovieTVDirectorMetadata
    {
        [Display(Name = "Movie/TV Director ID")]
        public int MovieTVDirectorID { get; set; }

        [Required(ErrorMessage = "* Movie/TV ID is required")]
        [Display(Name = "Movie/TV ID")]
        public int MovieTVID { get; set; }

        [Required(ErrorMessage = "* Director ID is required")]
        [Display(Name = "Director ID")]
        public int DirectorID { get; set; }

        [DisplayFormat(NullDisplayText = "N/A")]
        [Display(Name = "Director Order")]
        public Nullable<byte> DirectorOrder { get; set; }
    }

    [MetadataType(typeof(MovieTVDirectorMetadata))]
    public partial class MovieTVDirector
    {

    }
    #endregion

    #region MovieTVWriter Metadata
    public class MovieTVWriterMetadata
    {
        [Display(Name = "Movie/TV Writer ID")]
        public int MovieTVWriterID { get; set; }

        [Required(ErrorMessage = "* Movie/TV ID is required")]
        [Display(Name = "Movie/TV ID")]
        public int MovieTVID { get; set; }

        [Required(ErrorMessage = "* Writer ID is required")]
        [Display(Name = "Writer ID")]
        public int WriterID { get; set; }

        [DisplayFormat(NullDisplayText = "N/A")]
        [Display(Name = "Writer Order")]
        public Nullable<byte> WriterOrder { get; set; }
    }

    [MetadataType(typeof(MovieTVWriterMetadata))]
    public partial class MovieTVWriter
    {

    }
    #endregion

    #region MPAARating Metadata
    public class MPAARatingMetadata
    {
        [Display(Name = "MPAA Rating ID")]
        public int MPAARatingID { get; set; }

        [Required(ErrorMessage = "* MPAA Rating is required")]
        [StringLength(5, ErrorMessage = "* MPAA Rating cannot be longer than 5 characters")]
        [Display(Name = "Rated")]
        public string Rating { get; set; }

        [Required(ErrorMessage = "* MPAA Rating Information is required")]
        [StringLength(100, ErrorMessage = "* MPAA Rating Information cannot be longer than 100 characters")]
        [UIHint("MultilineText")]
        [Display(Name = "MPAA Rating Information")]
        public string RatingInfo { get; set; }
    }

    [MetadataType(typeof(MPAARatingMetadata))]
    public partial class MPAARating
    {

    }
    #endregion

    #region RegionCode Metadata
    public class RegionCodeMetadata
    {
        [Required(ErrorMessage = "* Region Code is required")]
        [Display(Name = "Region Code")]
        public string RegionCodeID { get; set; }

        [Required(ErrorMessage = "* Region Code Information is required")]
        [StringLength(150, ErrorMessage = "* Region Code Information cannot be longer than 150 characters")]
        [UIHint("MultilineText")]
        [Display(Name = "Region Code Information")]
        public string RegionCodeInfo { get; set; }
    }

    [MetadataType(typeof(RegionCodeMetadata))]
    public partial class RegionCode
    {

    }
    #endregion

    #region Studio Metadata
    public class StudioMetadata
    {
        [Display(Name = "Studio ID")]
        public int StudioID { get; set; }

        [Required(ErrorMessage = "* Studio Name is required")]
        [StringLength(50, ErrorMessage = "* Studio Name cannot be longer than 50 characters")]
        [Display(Name = "Studio Name")]
        public string StudioName { get; set; }

        [StringLength(50, ErrorMessage = "* Country cannot be longer than 50 characters")]
        [DisplayFormat(NullDisplayText = "N/A")]
        public string Country { get; set; }

        [Display(Name = "Active")]
        public bool IsActive { get; set; }
    }

    [MetadataType(typeof(StudioMetadata))]
    public partial class Studio
    {

    }
    #endregion

    #region TitleStatus Metadata
    public class TitleStatusMetadata
    {
        [Display(Name = "Title Status ID")]
        public int TitleStatusID { get; set; }

        [Required(ErrorMessage = "* Title Status is required")]
        [StringLength(25, ErrorMessage = "* Title Status cannot be longer than 25 characters")]
        [Display(Name = "Title Status")]
        public string TitleStatusName { get; set; }

        [StringLength(100, ErrorMessage = "* Notes cannot be longer than 100 characters")]
        [DisplayFormat(NullDisplayText = "N/A")]
        [UIHint("MultilineText")]
        public string Notes { get; set; }
    }

    [MetadataType(typeof(TitleStatusMetadata))]
    public partial class TitleStatus
    {

    }
    #endregion

    #region TitleType Metadata
    public class TitleTypeMetadata
    {
        [Display(Name = "Title Type ID")]
        public int TitleTypeID { get; set; }

        [Required(ErrorMessage = "* Title Type is required")]
        [StringLength(25, ErrorMessage = "* Title Type cannot be longer than 25 characters")]
        [Display(Name = "Title Type")]
        public string TitleTypeName { get; set; }
    }

    [MetadataType(typeof(TitleTypeMetadata))]
    public partial class TitleType
    {

    }
    #endregion

    #region Writer Metadata
    public class WriterMetadata
    {
        [Display(Name = "Writer ID")]
        public int WriterID { get; set; }

        [Required(ErrorMessage = "* First Name is required")]
        [StringLength(25, ErrorMessage = "* First Name cannot be longer than 25 characters")]
        [Display(Name = "First Name")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "* Last Name is required")]
        [StringLength(25, ErrorMessage = "* Last Name cannot be longer than 25 characters")]
        [Display(Name = "Last Name")]
        public string LastName { get; set; }

        [StringLength(50, ErrorMessage = "* Country cannot be longer than 50 characters")]
        [DisplayFormat(NullDisplayText = "N/A")]
        public string Country { get; set; }
    }

    [MetadataType(typeof(WriterMetadata))]
    public partial class Writer
    {
        [Display(Name = "Writer Name")]
        public string FullName { get { return FirstName + " " + LastName; } }
    }
    #endregion
}
