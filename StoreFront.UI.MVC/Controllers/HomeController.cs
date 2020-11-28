using System;
using System.Web.Mvc;
using StoreFront.UI.MVC.Models;
using System.Net.Mail;
using System.Net;
using System.Linq;
using StoreFront.DATA.EF;

namespace StoreFront.UI.MVC.Controllers
{
    public class HomeController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();

        //[HttpGet]
        public ActionResult Index()
        {
            ViewBag.NewDVDs = db.MoviesTVs.OrderBy(m => m.ReleaseDate).Where(m => m.DiscTypeID == 1 && m.IsSiteFeature == true).ToList();
            ViewBag.NewBDs = db.MoviesTVs.OrderBy(m => m.ReleaseDate).Where(m => m.DiscTypeID == 2 && m.IsSiteFeature == true).ToList();
            ViewBag.NewUHDs = db.MoviesTVs.OrderBy(m => m.ReleaseDate).Where(m => m.DiscTypeID == 3 && m.IsSiteFeature == true).ToList();

            ViewBag.TopDVDs = db.MoviesTVs.OrderByDescending(m => m.UnitsSold).Where(m => m.DiscTypeID == 1).ToList();
            ViewBag.TopBDs = db.MoviesTVs.OrderByDescending(m => m.UnitsSold).Where(m => m.DiscTypeID == 2).ToList();
            ViewBag.TopUHDs = db.MoviesTVs.OrderByDescending(m => m.UnitsSold).Where(m => m.DiscTypeID == 3).ToList();

            return View();
        }

        [HttpGet]
        public ActionResult About()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Contact()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Contact(ContactViewModel cvm)
        {
            if (!ModelState.IsValid)
            {
                return View(cvm);
            }

            string emailBody = $"You have received an email from {cvm.Name} with a subject {cvm.Subject}. Please respond to {cvm.Email} with your response to the following message: <br /> <br />{cvm.Message}";
            MailMessage msg = new MailMessage(
                "no-reply@justinlkennedy.com",
                "justin.l.kennedy@outlook.com",
                "Email from StoreFront.JustinLKennedy.com",
                emailBody);
            msg.IsBodyHtml = true;
            msg.Priority = MailPriority.High;
            SmtpClient client = new SmtpClient("mail.justinlkennedy.com");
            client.Credentials = new NetworkCredential("no-reply@justinlkennedy.com", "C3ntr!q");
            try
            {
                client.Send(msg);
            }
            catch (Exception ex)
            {
                ViewBag.ErrorMessage = $"Sorry, something went wrong. Error message: {ex.Message}<br />{ex.StackTrace}";
                return View(cvm);
            }
            return View("EmailConfirmation", cvm);
        }
    }
}
