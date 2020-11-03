using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StoreFront.DATA.EF;

namespace StoreFront.UI.MVC.Controllers
{
    public class FiltersController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();

        // GET: Filters
        public ActionResult Index()
        {
            return View();
        }
    }
}