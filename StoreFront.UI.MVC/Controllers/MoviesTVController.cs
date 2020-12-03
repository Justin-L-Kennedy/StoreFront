using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using StoreFront.DATA.EF;
using StoreFront.UI.MVC.Utilities; //gives us access to the ImageUploadUtility.cs
using StoreFront.UI.MVC.Models; //gives us access to the CartItemViewModel
using PagedList;

namespace StoreFront.UI.MVC.Controllers
{
    public class MoviesTVController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();

        // GET: MoviesTV
        public ActionResult Index(string searchString, string currentFilter, string sortOrder, string movieTVSort, int? page, int? PageSize)
        {
            List<MoviesTV> moviesTVs = new List<MoviesTV>();
            ViewBag.CurrentSort = sortOrder;
            if (searchString != null)
            {
                page = 1;
            }
            else
            {
                searchString = currentFilter;
            }
            ViewBag.CurrentFilter = searchString;

            #region Dropdown List for Sorting
            ViewBag.movieTVSort = new List<SelectListItem>()
            {
                new SelectListItem { Text = "", Selected = true},
                new SelectListItem { Text = "Alphabetical: A-Z", Value = "AlphaAZ" },
                new SelectListItem { Text = "Alphabetical: Z-A", Value = "AlphaZA" },
                new SelectListItem { Text = "Price: Low to High", Value = "PriceAsc" },
                new SelectListItem { Text = "Price: High to Low", Value = "PriceDesc" },
            };
            switch (movieTVSort)
            {
                case "AlphaAZ":
                    moviesTVs = db.MoviesTVs.Include(m => m.Genre).Include(m => m.Studio).Include(m => m.TitleStatus).Include(m => m.DiscType).Include(m => m.TitleType).Include(m => m.RegionCode).Include(m => m.MPAARating).OrderBy(s => s.Title).ToList();
                    break;
                case "AlphaZA":
                    moviesTVs = db.MoviesTVs.Include(m => m.Genre).Include(m => m.Studio).Include(m => m.TitleStatus).Include(m => m.DiscType).Include(m => m.TitleType).Include(m => m.RegionCode).Include(m => m.MPAARating).OrderByDescending(s => s.Title).ToList();
                    break;
                case "PriceAsc":
                    moviesTVs = db.MoviesTVs.Include(m => m.Genre).Include(m => m.Studio).Include(m => m.TitleStatus).Include(m => m.DiscType).Include(m => m.TitleType).Include(m => m.RegionCode).Include(m => m.MPAARating).OrderBy(s => s.Price).ToList();
                    break;
                case "PriceDesc":
                    moviesTVs = db.MoviesTVs.Include(m => m.Genre).Include(m => m.Studio).Include(m => m.TitleStatus).Include(m => m.DiscType).Include(m => m.TitleType).Include(m => m.RegionCode).Include(m => m.MPAARating).OrderByDescending(s => s.Price).ToList();
                    break;
                default:
                    moviesTVs = db.MoviesTVs.Include(m => m.Genre).Include(m => m.Studio).Include(m => m.TitleStatus).Include(m => m.DiscType).Include(m => m.TitleType).Include(m => m.RegionCode).Include(m => m.MPAARating).ToList();
                    break;
            }
            #endregion

            #region Filters
            ViewBag.Formats = db.DiscTypes.ToList();
            ViewBag.Genres = db.Genres.ToList();
            #endregion

            #region Dropdown List for Page Size
            int count = db.MoviesTVs.Count();
            ViewBag.PageSize = new List<SelectListItem>()
            {
                new SelectListItem { Text = "3", Value = "3", Selected = true },
                new SelectListItem { Text = "6", Value = "6" },
                new SelectListItem { Text = "9", Value = "9" },
                new SelectListItem { Text = "12", Value = "12" },
                new SelectListItem { Text = "All", Value = count.ToString() }
            };
            int pageNumber = (page ?? 1);
            int pageSize = (PageSize ?? 3);
            ViewBag.psize = pageSize;
            #endregion

            #region Search
            if (!String.IsNullOrEmpty(searchString))
            {
                moviesTVs = (
                    from m in moviesTVs
                    where m.Title.ToLower().Contains(searchString.ToLower()) ||
                    m.Description.ToLower().Contains(searchString.ToLower()) ||
                    m.DiscType.DiscTypeName.ToLower().Contains(searchString.ToLower()) ||
                    m.DiscType.DiscTypeDescription.ToLower().Contains(searchString.ToLower()) ||
                    m.Genre.GenreName.ToLower().Contains(searchString.ToLower()) ||
                    m.Studio.StudioName.ToLower().Contains(searchString.ToLower()) ||
                    m.TitleType.TitleTypeName.ToLower().Contains(searchString.ToLower())
                    select m
                    ).ToList();
                ViewBag.SearchString = searchString;
            }
            #endregion

            return View(moviesTVs.ToPagedList(pageNumber, pageSize));
        }

        // GET: MoviesTV/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MoviesTV moviesTV = db.MoviesTVs.Find(id);
            if (moviesTV == null)
            {
                return HttpNotFound();
            }

            #region Actors
            var movieActors = db.MovieTVActors.Where(m => m.MovieTVID == id).ToList();
            var actors = db.Actors.ToList();
            List<Actor> cast = new List<Actor>();
            foreach (var a in actors)
            {
                foreach (var ma in movieActors)
                {
                    if (a.ActorID == ma.ActorID)
                    {
                        a.ActorOrder = ma.ActorOrder;
                        a.Character = ma.Character;
                        cast.Add(a);
                    }
                }
            }
            ViewBag.Cast = cast;
            #endregion

            #region Directors
            var movieDirectors = db.MovieTVDirectors.Where(m => m.MovieTVID == id).ToList();
            var directors = db.Directors.ToList();
            List<Director> directedBy = new List<Director>();
            foreach (var d in directors)
            {
                foreach (var md in movieDirectors)
                {
                    if (d.DirectorID == md.DirectorID)
                    {
                        d.DirectorOrder = md.DirectorOrder;
                        directedBy.Add(d);
                    }
                }
            }
            ViewBag.DirectedBy = directedBy;
            #endregion

            #region Writers
            var movieWriters = db.MovieTVWriters.Where(m => m.MovieTVID == id).ToList();
            var writers = db.Writers.ToList();
            List<Writer> writtenBy = new List<Writer>();
            foreach (var w in writers)
            {
                foreach (var mw in movieWriters)
                {
                    if (w.WriterID == mw.WriterID)
                    {
                        w.WriterOrder = mw.WriterOrder;
                        writtenBy.Add(w);
                    }
                }
            }
            ViewBag.WrittenBy = writtenBy;
            #endregion

            #region Related Products
            ViewBag.RelatedMoviesTVs = db.MoviesTVs.ToList();
            #endregion

            return View(moviesTV);
        }

        #region Custom Add-to-Cart functionality (called from the Details View)
        public ActionResult AddToCart(int qty, int movieTVID)
        {
            //We will use a Dictionary collection type to store items into the cart
            //Dictionaries store info as Key, Value pairs
            Dictionary<int, CartItemViewModel> shoppingCart = null;

            //check if the session variable called cart already exists - if it does we will use it to populate the local collection of shopping cart items we called shoppingCart
            if (Session["cart"] != null)
            {
                //session variable already exists and we will put items from it into our Dictionary called shoppingCart (local list of shopping cart items)
                shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];
                //when we UNBOX an object stored in Session to it's smaller more specific type we are using explicit casting
            }
            else
            {
                //if session cart doesn't exist yet, we need to instantiate it (aka NEW IT UP)
                shoppingCart = new Dictionary<int, CartItemViewModel>();
            }
            //after the if/else above we have a local version of the shopping cart list that is ready to have items added to it

            //find the product referenced by the ID that was passed to this method
            MoviesTV product = db.MoviesTVs.Where(m => m.MovieTVID == movieTVID).FirstOrDefault();
            if (product == null)
            {
                //if bad ID, kick them back to the same page to try again or you could throw an error
                return RedirectToAction("Index");
            }
            else
            {
                //if the book IS valid, add the line-item to the cart
                CartItemViewModel item = new CartItemViewModel(qty, product);

                //put item in the local cart BUT if we already have that product as a cart item, then we will just update the quantity
                //THIS is why Dictionary is a great choice for the shopping cart collection
                if (shoppingCart.ContainsKey(product.MovieTVID))
                {
                    shoppingCart[product.MovieTVID].Qty += qty;
                }
                else
                {
                    shoppingCart.Add(product.MovieTVID, item);
                }
                //now update the Session version of Shopping Cart so we can maintain the info between request/response cycles
                Session["cart"] = shoppingCart; //implicit casting or boxing
                Session["confirm"] = $"'{product.Title}' (Quantity: {qty}) added to cart";
            }
            //send the user to a view that shows their cart items
            return RedirectToAction("Index", "ShoppingCart");
        }
        #endregion

        // GET: MoviesTV/Create
        [Authorize(Roles = "Admin")]
        public ActionResult Create()
        {
            ViewBag.GenreID = new SelectList(db.Genres, "GenreID", "GenreName");
            ViewBag.StudioID = new SelectList(db.Studios, "StudioID", "StudioName");
            ViewBag.TitleStatusID = new SelectList(db.TitleStatuses, "TitleStatusID", "TitleStatusName");
            ViewBag.DiscTypeID = new SelectList(db.DiscTypes, "DiscTypeID", "DiscTypeName");
            ViewBag.TitleTypeID = new SelectList(db.TitleTypes, "TitleTypeID", "TitleTypeName");
            ViewBag.RegionCodeID = new SelectList(db.RegionCodes, "RegionCodeID", "RegionCodeID");
            ViewBag.MPAARatingID = new SelectList(db.MPAARatings, "MPAARatingID", "Rating");
            return View();
        }

        // POST: MoviesTV/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Create([Bind(Include = "MovieTVID,DiscTypeID,RegionCodeID,UPC,TitleTypeID,Title,Description,GenreID,Runtime,MPAARatingID,Price,UnitsSold,ReleaseDate,StudioID,TitleImage,IsSiteFeature,IsOnSaleFeature,TitleStatusID")] MoviesTV moviesTV, HttpPostedFileBase titleCover)
        {
            if (ModelState.IsValid)
            {
                #region File Upload
                string file = "NoImage.png";
                if (titleCover != null)
                {
                    file = titleCover.FileName;
                    string ext = file.Substring(file.LastIndexOf('.'));
                    string[] goodExts = { ".jpeg", ".jpg", ".png", ".gif" };
                    //check that the uploaded file ext is in our list of good file extensions
                    if (goodExts.Contains(ext))
                    {
                        //if valid ext, check file size <= 4mb (max by default from ASP.NET)
                        if (titleCover.ContentLength <= 4194304)
                        {
                            //create a new file name using a guid
                            //file = Guid.NewGuid() + ext;

                            #region Resize Image
                            string savePath = Server.MapPath("~/Content/img/MoviesTV/");
                            Image convertedImage = Image.FromStream(titleCover.InputStream);
                            int maxImageSize = 650;
                            int maxThumbSize = 250;
                            ImageUploadUtility.ResizeImage(savePath, file, convertedImage, maxImageSize, maxThumbSize);
                            #endregion
                        }
                    }
                }
                moviesTV.TitleImage = file;
                #endregion
                db.MoviesTVs.Add(moviesTV);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.GenreID = new SelectList(db.Genres, "GenreID", "GenreName", moviesTV.GenreID);
            ViewBag.StudioID = new SelectList(db.Studios, "StudioID", "StudioName", moviesTV.StudioID);
            ViewBag.TitleStatusID = new SelectList(db.TitleStatuses, "TitleStatusID", "TitleStatusName", moviesTV.TitleStatusID);
            ViewBag.DiscTypeID = new SelectList(db.DiscTypes, "DiscTypeID", "DiscTypeName", moviesTV.DiscTypeID);
            ViewBag.TitleTypeID = new SelectList(db.TitleTypes, "TitleTypeID", "TitleTypeName", moviesTV.TitleTypeID);
            ViewBag.RegionCodeID = new SelectList(db.RegionCodes, "RegionCodeID", "RegionCodeID", moviesTV.RegionCodeID);
            ViewBag.MPAARatingID = new SelectList(db.MPAARatings, "MPAARatingID", "Rating", moviesTV.MPAARatingID);
            return View(moviesTV);
        }

        // GET: MoviesTV/Edit/5
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MoviesTV moviesTV = db.MoviesTVs.Find(id);
            if (moviesTV == null)
            {
                return HttpNotFound();
            }
            ViewBag.GenreID = new SelectList(db.Genres, "GenreID", "GenreName", moviesTV.GenreID);
            ViewBag.StudioID = new SelectList(db.Studios, "StudioID", "StudioName", moviesTV.StudioID);
            ViewBag.TitleStatusID = new SelectList(db.TitleStatuses, "TitleStatusID", "TitleStatusName", moviesTV.TitleStatusID);
            ViewBag.DiscTypeID = new SelectList(db.DiscTypes, "DiscTypeID", "DiscTypeName", moviesTV.DiscTypeID);
            ViewBag.TitleTypeID = new SelectList(db.TitleTypes, "TitleTypeID", "TitleTypeName", moviesTV.TitleTypeID);
            ViewBag.RegionCodeID = new SelectList(db.RegionCodes, "RegionCodeID", "RegionCodeID", moviesTV.RegionCodeID);
            ViewBag.MPAARatingID = new SelectList(db.MPAARatings, "MPAARatingID", "Rating", moviesTV.MPAARatingID);
            return View(moviesTV);
        }

        // POST: MoviesTV/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Edit([Bind(Include = "MovieTVID,DiscTypeID,RegionCodeID,UPC,TitleTypeID,Title,Description,GenreID,Runtime,MPAARatingID,Price,UnitsSold,ReleaseDate,StudioID,TitleImage,IsSiteFeature,IsOnSaleFeature,TitleStatusID")] MoviesTV moviesTV, HttpPostedFileBase titleCover)
        {
            if (ModelState.IsValid)
            {
                #region File Upload
                if (titleCover != null)
                {
                    string file = titleCover.FileName;
                    string ext = file.Substring(file.LastIndexOf('.'));
                    string[] goodExts = { ".jpeg", ".jpg", ".png", ".gif" };
                    //check that the uploaded file ext is in our list of good file extensions
                    if (goodExts.Contains(ext))
                    {
                        //if valid ext, check file size <= 4mb (max by default from ASP.NET)
                        if (titleCover.ContentLength <= 4194304)
                        {
                            //create a new file name using a guid
                            //file = Guid.NewGuid() + ext;

                            #region Resize Image
                            string savePath = Server.MapPath("~/Content/img/MoviesTV/");
                            Image convertedImage = Image.FromStream(titleCover.InputStream);
                            int maxImageSize = 650;
                            int maxThumbSize = 250;
                            ImageUploadUtility.ResizeImage(savePath, file, convertedImage, maxImageSize, maxThumbSize);
                            #endregion

                            if (moviesTV.TitleImage != null && moviesTV.TitleImage != "NoImage.png")
                            {
                                string path = Server.MapPath("~/Content/img/MoviesTV/");
                                ImageUploadUtility.Delete(path, moviesTV.TitleImage);
                            }
                        }
                    }
                    moviesTV.TitleImage = file;
                }
                #endregion
                db.Entry(moviesTV).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.GenreID = new SelectList(db.Genres, "GenreID", "GenreName", moviesTV.GenreID);
            ViewBag.StudioID = new SelectList(db.Studios, "StudioID", "StudioName", moviesTV.StudioID);
            ViewBag.TitleStatusID = new SelectList(db.TitleStatuses, "TitleStatusID", "TitleStatusName", moviesTV.TitleStatusID);
            ViewBag.DiscTypeID = new SelectList(db.DiscTypes, "DiscTypeID", "DiscTypeName", moviesTV.DiscTypeID);
            ViewBag.TitleTypeID = new SelectList(db.TitleTypes, "TitleTypeID", "TitleTypeName", moviesTV.TitleTypeID);
            ViewBag.RegionCodeID = new SelectList(db.RegionCodes, "RegionCodeID", "RegionCodeID", moviesTV.RegionCodeID);
            ViewBag.MPAARatingID = new SelectList(db.MPAARatings, "MPAARatingID", "Rating", moviesTV.MPAARatingID);
            return View(moviesTV);
        }

        // GET: MoviesTV/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MoviesTV moviesTV = db.MoviesTVs.Find(id);
            if (moviesTV == null)
            {
                return HttpNotFound();
            }
            return View(moviesTV);
        }

        // POST: MoviesTV/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult DeleteConfirmed(int id)
        {
            MoviesTV moviesTV = db.MoviesTVs.Find(id);
            //Delete the image file of the record that is being removed
            if (moviesTV.TitleImage != null && moviesTV.TitleImage != "NoImage.png")
            {
                string path = Server.MapPath("~/Content/img/MoviesTV/");
                ImageUploadUtility.Delete(path, moviesTV.TitleImage);
            }
            db.MoviesTVs.Remove(moviesTV);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
