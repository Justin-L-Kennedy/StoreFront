using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using StoreFront.DATA.EF;

namespace StoreFront.UI.MVC.Controllers
{
    public class MovieTVDirectorsController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();

        // GET: MovieTVDirectors
        public ActionResult Index()
        {
            var movieTVDirectors = db.MovieTVDirectors.Include(m => m.Director).Include(m => m.MoviesTV);
            return View(movieTVDirectors.ToList());
        }

        // GET: MovieTVDirectors/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MovieTVDirector movieTVDirector = db.MovieTVDirectors.Find(id);
            if (movieTVDirector == null)
            {
                return HttpNotFound();
            }
            return View(movieTVDirector);
        }

        // GET: MovieTVDirectors/Create
        [Authorize(Roles = "Admin")]
        public ActionResult Create()
        {
            ViewBag.DirectorID = new SelectList(db.Directors, "DirectorID", "FullName");
            ViewBag.MovieTVID = new SelectList(db.MoviesTVs, "MovieTVID", "Title");
            return View();
        }

        // POST: MovieTVDirectors/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Create([Bind(Include = "MovieTVDirectorID,MovieTVID,DirectorID,DirectorOrder")] MovieTVDirector movieTVDirector)
        {
            if (ModelState.IsValid)
            {
                db.MovieTVDirectors.Add(movieTVDirector);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.DirectorID = new SelectList(db.Directors, "DirectorID", "FullName", movieTVDirector.DirectorID);
            ViewBag.MovieTVID = new SelectList(db.MoviesTVs, "MovieTVID", "Title", movieTVDirector.MovieTVID);
            return View(movieTVDirector);
        }

        // GET: MovieTVDirectors/Edit/5
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MovieTVDirector movieTVDirector = db.MovieTVDirectors.Find(id);
            if (movieTVDirector == null)
            {
                return HttpNotFound();
            }
            ViewBag.DirectorID = new SelectList(db.Directors, "DirectorID", "FullName", movieTVDirector.DirectorID);
            ViewBag.MovieTVID = new SelectList(db.MoviesTVs, "MovieTVID", "Title", movieTVDirector.MovieTVID);
            return View(movieTVDirector);
        }

        // POST: MovieTVDirectors/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Edit([Bind(Include = "MovieTVDirectorID,MovieTVID,DirectorID,DirectorOrder")] MovieTVDirector movieTVDirector)
        {
            if (ModelState.IsValid)
            {
                db.Entry(movieTVDirector).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.DirectorID = new SelectList(db.Directors, "DirectorID", "FullName", movieTVDirector.DirectorID);
            ViewBag.MovieTVID = new SelectList(db.MoviesTVs, "MovieTVID", "Title", movieTVDirector.MovieTVID);
            return View(movieTVDirector);
        }

        // GET: MovieTVDirectors/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MovieTVDirector movieTVDirector = db.MovieTVDirectors.Find(id);
            if (movieTVDirector == null)
            {
                return HttpNotFound();
            }
            return View(movieTVDirector);
        }

        // POST: MovieTVDirectors/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult DeleteConfirmed(int id)
        {
            MovieTVDirector movieTVDirector = db.MovieTVDirectors.Find(id);
            db.MovieTVDirectors.Remove(movieTVDirector);
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
