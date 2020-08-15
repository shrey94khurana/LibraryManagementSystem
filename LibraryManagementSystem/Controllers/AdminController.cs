using LibraryManagementSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LibraryManagementSystem.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin

        Bookdetails bd = new Bookdetails();
        public ActionResult Index()
        {


            return View();
        }

        [HttpGet]
        public ActionResult View_details()
        {

            
            return View(bd.getbooks());
        }
        //[HttpPost]
        //public ActionResult View_details(FormCollection fobj)
        //{

        //    String BookName =fobj["BookName"];
        //    String Description =fobj["Description"];
        //    int Cost =Convert.ToInt32(fobj["Cost"]);
        //    return View(insertbooks());
        //}

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }


        [HttpPost]
        public ActionResult Create(Books obj)
        {
            int i = bd.insertbooks(obj);
            if (i > 0)
            {
                return RedirectToAction("Create"); 
            }
            else
            {
                return View();
            }

        }

        //[HttpGet]
        //public ActionResult Edit(int? id)
        //{
        //    Books obj = new Books();
        //    obj = bd.GetBookById(id);

        //    return View(obj);
        //}

        [HttpPost]
        public ActionResult Edit(Books obj)
        {
            int i = bd.UpdateBooks(obj);
            if (i > 0)
            {
                return RedirectToAction("Edit");
            }
            else
            {
                return View();
            }

        }

        //[HttpGet]
        //public ActionResult Delete(int? id)
        //{
        //    Books obj = new Books();
        //    obj = bd.GetBookById(id);

        //    return View(obj);
        //}

        [HttpPost]
        [ActionName("Delete")]
        public ActionResult DeleteConfirmed(int? id)
        {
            int i = bd.DeleteBooks(id);
            if (i > 0)
            {
                return RedirectToAction("Home");
            }
            else
            {
                return View();
            }

        }



        [HttpGet]
        public ActionResult Home()
        {


            return View();
        }
        [HttpGet]
        public ActionResult About()
        {


            return View();
        }
        [HttpGet]
        public ActionResult ContactUs()
        {


            return View();
        }

    }
}