﻿using System;
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
    public class WritersController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();

        // GET: Writers
        public ActionResult Index()
        {
            return View(db.Writers.ToList());
        }

        // GET: Writers/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Writer writer = db.Writers.Find(id);
            if (writer == null)
            {
                return HttpNotFound();
            }
            return View(writer);
        }

        // GET: Writers/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Writers/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "WriterID,FirstName,LastName,Country")] Writer writer)
        {
            if (ModelState.IsValid)
            {
                db.Writers.Add(writer);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(writer);
        }

        // GET: Writers/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Writer writer = db.Writers.Find(id);
            if (writer == null)
            {
                return HttpNotFound();
            }
            return View(writer);
        }

        // POST: Writers/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "WriterID,FirstName,LastName,Country")] Writer writer)
        {
            if (ModelState.IsValid)
            {
                db.Entry(writer).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(writer);
        }

        // GET: Writers/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Writer writer = db.Writers.Find(id);
            if (writer == null)
            {
                return HttpNotFound();
            }
            return View(writer);
        }

        // POST: Writers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Writer writer = db.Writers.Find(id);
            db.Writers.Remove(writer);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        #region AJAX CRUD
        [HttpPost]
        [ValidateAntiForgeryToken]
        public JsonResult AjaxCreate(Writer writer)
        {
            db.Writers.Add(writer);
            db.SaveChanges();
            return Json(writer);
        }

        [HttpGet]
        public PartialViewResult WriterEdit(int id)
        {
            Writer writer = db.Writers.Find(id);
            return PartialView(writer);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public JsonResult AjaxEdit(Writer writer)
        {
            db.Entry(writer).State = EntityState.Modified;
            db.SaveChanges();
            return Json(writer);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public JsonResult AjaxDelete(int id)
        {
            Writer writer = db.Writers.Find(id);
            db.Writers.Remove(writer);
            db.SaveChanges();
            string confirmMessage = string.Format("Deleted writer '{0}' from database!", writer.FullName);
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