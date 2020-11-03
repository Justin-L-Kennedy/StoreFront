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
    public class MovieTVActorsController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();

        // GET: MovieTVActors
        public ActionResult Index()
        {
            var movieTVActors = db.MovieTVActors.Include(m => m.Actor).Include(m => m.MoviesTV);
            return View(movieTVActors.ToList());
        }

        // GET: MovieTVActors/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MovieTVActor movieTVActor = db.MovieTVActors.Find(id);
            if (movieTVActor == null)
            {
                return HttpNotFound();
            }
            return View(movieTVActor);
        }

        // GET: MovieTVActors/Create
        public ActionResult Create()
        {
            ViewBag.ActorID = new SelectList(db.Actors, "ActorID", "FullName");
            ViewBag.MovieTVID = new SelectList(db.MoviesTVs, "MovieTVID", "Title");
            return View();
        }

        // POST: MovieTVActors/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MovieTVActorID,MovieTVID,ActorID,ActorOrder,Character")] MovieTVActor movieTVActor)
        {
            if (ModelState.IsValid)
            {
                db.MovieTVActors.Add(movieTVActor);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ActorID = new SelectList(db.Actors, "ActorID", "FullName", movieTVActor.ActorID);
            ViewBag.MovieTVID = new SelectList(db.MoviesTVs, "MovieTVID", "Title", movieTVActor.MovieTVID);
            return View(movieTVActor);
        }

        // GET: MovieTVActors/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MovieTVActor movieTVActor = db.MovieTVActors.Find(id);
            if (movieTVActor == null)
            {
                return HttpNotFound();
            }
            ViewBag.ActorID = new SelectList(db.Actors, "ActorID", "FullName", movieTVActor.ActorID);
            ViewBag.MovieTVID = new SelectList(db.MoviesTVs, "MovieTVID", "Title", movieTVActor.MovieTVID);
            return View(movieTVActor);
        }

        // POST: MovieTVActors/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MovieTVActorID,MovieTVID,ActorID,ActorOrder,Character")] MovieTVActor movieTVActor)
        {
            if (ModelState.IsValid)
            {
                db.Entry(movieTVActor).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ActorID = new SelectList(db.Actors, "ActorID", "FullName", movieTVActor.ActorID);
            ViewBag.MovieTVID = new SelectList(db.MoviesTVs, "MovieTVID", "Title", movieTVActor.MovieTVID);
            return View(movieTVActor);
        }

        // GET: MovieTVActors/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MovieTVActor movieTVActor = db.MovieTVActors.Find(id);
            if (movieTVActor == null)
            {
                return HttpNotFound();
            }
            return View(movieTVActor);
        }

        // POST: MovieTVActors/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            MovieTVActor movieTVActor = db.MovieTVActors.Find(id);
            db.MovieTVActors.Remove(movieTVActor);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //#region AJAX CRUD
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public JsonResult AjaxCreate(MovieTVActor movieTVActor)
        //{
        //    db.MovieTVActors.Add(movieTVActor);
        //    db.SaveChanges();
        //    ViewBag.ActorID = new SelectList(db.Actors, "ActorID", "FullName", movieTVActor.ActorID);
        //    ViewBag.MovieTVID = new SelectList(db.MoviesTVs, "MovieTVID", "Title", movieTVActor.MovieTVID);
        //    return Json(movieTVActor);
        //}

        //[HttpGet]
        //public PartialViewResult MovieTVActorEdit(int id)
        //{
        //    MovieTVActor movieTVActor = db.MovieTVActors.Find(id);
        //    return PartialView(movieTVActor);
        //}

        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public JsonResult AjaxEdit(MovieTVActor movieTVActor)
        //{
        //    db.Entry(movieTVActor).State = EntityState.Modified;
        //    db.SaveChanges();
        //    return Json(movieTVActor);
        //}

        //[AcceptVerbs(HttpVerbs.Post)]
        //public JsonResult AjaxDelete(int id)
        //{
        //    MovieTVActor movieTVActor = db.MovieTVActors.Find(id);
        //    db.MovieTVActors.Remove(movieTVActor);
        //    db.SaveChanges();
        //    string confirmMessage = string.Format("Deleted actor '{0}' from '{1}' database!", movieTVActor.Actor.FullName, movieTVActor.MoviesTV.Title);
        //    return Json(new { id = id, message = confirmMessage });
        //}
        //#endregion

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
