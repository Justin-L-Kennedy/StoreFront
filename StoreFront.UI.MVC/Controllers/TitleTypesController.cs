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
    public class TitleTypesController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();

        // GET: TitleTypes
        public ActionResult Index()
        {
            return View(db.TitleTypes.ToList());
        }

        // GET: TitleTypes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TitleType titleType = db.TitleTypes.Find(id);
            if (titleType == null)
            {
                return HttpNotFound();
            }
            return View(titleType);
        }

        // GET: TitleTypes/Create
        [Authorize(Roles = "Admin")]
        public ActionResult Create()
        {
            return View();
        }

        // POST: TitleTypes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Create([Bind(Include = "TitleTypeID,TitleTypeName")] TitleType titleType)
        {
            if (ModelState.IsValid)
            {
                db.TitleTypes.Add(titleType);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(titleType);
        }

        // GET: TitleTypes/Edit/5
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TitleType titleType = db.TitleTypes.Find(id);
            if (titleType == null)
            {
                return HttpNotFound();
            }
            return View(titleType);
        }

        // POST: TitleTypes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Edit([Bind(Include = "TitleTypeID,TitleTypeName")] TitleType titleType)
        {
            if (ModelState.IsValid)
            {
                db.Entry(titleType).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(titleType);
        }

        // GET: TitleTypes/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TitleType titleType = db.TitleTypes.Find(id);
            if (titleType == null)
            {
                return HttpNotFound();
            }
            return View(titleType);
        }

        // POST: TitleTypes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult DeleteConfirmed(int id)
        {
            TitleType titleType = db.TitleTypes.Find(id);
            db.TitleTypes.Remove(titleType);
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
