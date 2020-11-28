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
    public class TitleStatusController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();

        // GET: TitleStatus
        public ActionResult Index()
        {
            return View(db.TitleStatuses.ToList());
        }

        // GET: TitleStatus/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TitleStatus titleStatus = db.TitleStatuses.Find(id);
            if (titleStatus == null)
            {
                return HttpNotFound();
            }
            return View(titleStatus);
        }

        // GET: TitleStatus/Create
        [Authorize(Roles = "Admin")]
        public ActionResult Create()
        {
            return View();
        }

        // POST: TitleStatus/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Create([Bind(Include = "TitleStatusID,TitleStatusName,Notes")] TitleStatus titleStatus)
        {
            if (ModelState.IsValid)
            {
                db.TitleStatuses.Add(titleStatus);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(titleStatus);
        }

        // GET: TitleStatus/Edit/5
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TitleStatus titleStatus = db.TitleStatuses.Find(id);
            if (titleStatus == null)
            {
                return HttpNotFound();
            }
            return View(titleStatus);
        }

        // POST: TitleStatus/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Edit([Bind(Include = "TitleStatusID,TitleStatusName,Notes")] TitleStatus titleStatus)
        {
            if (ModelState.IsValid)
            {
                db.Entry(titleStatus).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(titleStatus);
        }

        // GET: TitleStatus/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TitleStatus titleStatus = db.TitleStatuses.Find(id);
            if (titleStatus == null)
            {
                return HttpNotFound();
            }
            return View(titleStatus);
        }

        // POST: TitleStatus/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult DeleteConfirmed(int id)
        {
            TitleStatus titleStatus = db.TitleStatuses.Find(id);
            db.TitleStatuses.Remove(titleStatus);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        #region AJAX CRUD
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public JsonResult AjaxCreate(TitleStatus titleStatus)
        {
            db.TitleStatuses.Add(titleStatus);
            db.SaveChanges();
            return Json(titleStatus);
        }

        [HttpGet]
        [Authorize(Roles = "Admin")]
        public PartialViewResult TitleStatusEdit(int id)
        {
            TitleStatus titleStatus = db.TitleStatuses.Find(id);
            return PartialView(titleStatus);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public JsonResult AjaxEdit(TitleStatus titleStatus)
        {
            db.Entry(titleStatus).State = EntityState.Modified;
            db.SaveChanges();
            return Json(titleStatus);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [Authorize(Roles = "Admin")]
        public JsonResult AjaxDelete(int id)
        {
            TitleStatus titleStatus = db.TitleStatuses.Find(id);
            db.TitleStatuses.Remove(titleStatus);
            db.SaveChanges();
            string confirmMessage = string.Format("Deleted title status '{0}' from database!", titleStatus.TitleStatusName);
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
