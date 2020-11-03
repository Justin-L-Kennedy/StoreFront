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
    public class StudiosController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();

        // GET: Studios
        public ActionResult Index()
        {
            return View(db.Studios.ToList());
        }

        // GET: Studios/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Studio studio = db.Studios.Find(id);
            if (studio == null)
            {
                return HttpNotFound();
            }
            return View(studio);
        }

        // GET: Studios/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Studios/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "StudioID,StudioName,Country,IsActive")] Studio studio)
        {
            if (ModelState.IsValid)
            {
                db.Studios.Add(studio);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(studio);
        }

        // GET: Studios/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Studio studio = db.Studios.Find(id);
            if (studio == null)
            {
                return HttpNotFound();
            }
            return View(studio);
        }

        // POST: Studios/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "StudioID,StudioName,Country,IsActive")] Studio studio)
        {
            if (ModelState.IsValid)
            {
                db.Entry(studio).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(studio);
        }

        // GET: Studios/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Studio studio = db.Studios.Find(id);
            if (studio == null)
            {
                return HttpNotFound();
            }
            return View(studio);
        }

        // POST: Studios/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Studio studio = db.Studios.Find(id);
            db.Studios.Remove(studio);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        #region AJAX CRUD
        [HttpPost]
        [ValidateAntiForgeryToken]
        public JsonResult AjaxCreate(Studio studio)
        {
            db.Studios.Add(studio);
            db.SaveChanges();
            return Json(studio);
        }

        [HttpGet]
        public PartialViewResult StudioEdit(int id)
        {
            Studio studio = db.Studios.Find(id);
            return PartialView(studio);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public JsonResult AjaxEdit(Studio studio)
        {
            db.Entry(studio).State = EntityState.Modified;
            db.SaveChanges();
            return Json(studio);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public JsonResult AjaxDelete(int id)
        {
            Studio studio = db.Studios.Find(id);
            db.Studios.Remove(studio);
            db.SaveChanges();
            string confirmMessage = string.Format("Deleted studio '{0}' from database!", studio.StudioName);
            return Json(new { id = id, message = confirmMessage });
        }
        #endregion

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
