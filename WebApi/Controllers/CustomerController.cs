using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using WebApi.Models;

namespace WebApi.Controllers
{
    public class CustomerController : ApiController
    {
        /// <summary>
        /// DB Context de la base de datos
        /// </summary>
        private DBModel db = new DBModel();

        // GET: api/Customer
        [ResponseType(typeof(Customer))]
        public IHttpActionResult GetCustomer()
        {
            return Ok(db.Customer.ToList());
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