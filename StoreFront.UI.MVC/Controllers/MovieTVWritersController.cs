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
    public class MovieTVWritersController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();

        // GET: MovieTVWriters
        public ActionResult Index()
        {
            var movieTVWriters = db.MovieTVWriters.Include(m => m.MoviesTV).Include(m => m.Writer);
            return View(movieTVWriters.ToList());
        }

        // GET: MovieTVWriters/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MovieTVWriter movieTVWriter = db.MovieTVWriters.Find(id);
            if (movieTVWriter == null)
            {
                return HttpNotFound();
            }
            return View(movieTVWriter);
        }

        // GET: MovieTVWriters/Create
        [Authorize(Roles = "Admin")]
        public ActionResult Create()
        {
            ViewBag.MovieTVID = new SelectList(db.MoviesTVs, "MovieTVID", "Title");
            ViewBag.WriterID = new SelectList(db.Writers, "WriterID", "FullName");
            return View();
        }

        // POST: MovieTVWriters/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Create([Bind(Include = "MovieTVWriterID,MovieTVID,WriterID,WriterOrder")] MovieTVWriter movieTVWriter)
        {
            if (ModelState.IsValid)
            {
                db.MovieTVWriters.Add(movieTVWriter);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MovieTVID = new SelectList(db.MoviesTVs, "MovieTVID", "Title", movieTVWriter.MovieTVID);
            ViewBag.WriterID = new SelectList(db.Writers, "WriterID", "FullName", movieTVWriter.WriterID);
            return View(movieTVWriter);
        }

        // GET: MovieTVWriters/Edit/5
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MovieTVWriter movieTVWriter = db.MovieTVWriters.Find(id);
            if (movieTVWriter == null)
            {
                return HttpNotFound();
            }
            ViewBag.MovieTVID = new SelectList(db.MoviesTVs, "MovieTVID", "Title", movieTVWriter.MovieTVID);
            ViewBag.WriterID = new SelectList(db.Writers, "WriterID", "FullName", movieTVWriter.WriterID);
            return View(movieTVWriter);
        }

        // POST: MovieTVWriters/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Edit([Bind(Include = "MovieTVWriterID,MovieTVID,WriterID,WriterOrder")] MovieTVWriter movieTVWriter)
        {
            if (ModelState.IsValid)
            {
                db.Entry(movieTVWriter).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MovieTVID = new SelectList(db.MoviesTVs, "MovieTVID", "Title", movieTVWriter.MovieTVID);
            ViewBag.WriterID = new SelectList(db.Writers, "WriterID", "FullName", movieTVWriter.WriterID);
            return View(movieTVWriter);
        }

        // GET: MovieTVWriters/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MovieTVWriter movieTVWriter = db.MovieTVWriters.Find(id);
            if (movieTVWriter == null)
            {
                return HttpNotFound();
            }
            return View(movieTVWriter);
        }

        // POST: MovieTVWriters/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult DeleteConfirmed(int id)
        {
            MovieTVWriter movieTVWriter = db.MovieTVWriters.Find(id);
            db.MovieTVWriters.Remove(movieTVWriter);
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
