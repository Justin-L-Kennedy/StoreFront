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
using StoreFront.UI.MVC.Utilities; //gives us access to the ImageService.cs
using StoreFront.UI.MVC.Models; //gives us access to the CartItemViewModel

namespace StoreFront.UI.MVC.Controllers
{
    public class MoviesTVController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();

        // GET: MoviesTV
        public ActionResult Index()
        {
            var moviesTVs = db.MoviesTVs.Include(m => m.Genre).Include(m => m.Studio).Include(m => m.TitleStatus).Include(m => m.DiscType).Include(m => m.TitleType).Include(m => m.RegionCode).Include(m => m.MPAARating);
            return View(moviesTVs.ToList());
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
            return View(moviesTV);
        }

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
                            int maxImageSize = 500;
                            int maxThumbSize = 100;
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
                            int maxImageSize = 500;
                            int maxThumbSize = 100;
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
