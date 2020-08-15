using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LibraryManagementSystem.Models;

namespace LibraryManagementSystem.Controllers
{
    public class AuthorController : Controller
    {
        AuthorContext db = new AuthorContext();

        // GET: Author
        [Authorize]
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult IndexAuthor()
        {
            return View(db.GetAuthors());
        }

        [HttpGet]
        public ActionResult CreateAuthor()
        {
            return View();

        }

        [HttpPost]
        public ActionResult CreateAuthor(AuthorModel obj)
        {
            int i = db.SaveAuthor(obj);
            if (i > 0)
            {
                return RedirectToAction("IndexAuthor");
            }
            else
            {
                return View();
            }

        }

        [HttpGet]
        public ActionResult EditAuthor(int? id)
        {
            AuthorModel authobj = new AuthorModel();
            authobj = db.GetAuthorById(id);

            return View(authobj);
        }

        [HttpPost]
        public ActionResult EditAuthor(AuthorModel obj)
        {
            int i = db.UpdateAuthor(obj);
            if (i > 0)
            {
                return RedirectToAction("IndexAuthor");
            }
            else
            {
                return View();
            }

        }

        [HttpGet]
        public ActionResult DeleteAuthor(int? id)
        {
            AuthorModel authobj = new AuthorModel();
            authobj = db.GetAuthorById(id);

            return View(authobj);
        }

        [HttpPost]
        [ActionName("DeleteAuthor")]
        public ActionResult DeleteConfirmedAuthor(int? id)
        {
            int i = db.DeleteAuthor(id);
            if (i > 0)
            {
                return RedirectToAction("IndexAuthor");
            }
            else
            {
                return View();
            }


        }
    }
}