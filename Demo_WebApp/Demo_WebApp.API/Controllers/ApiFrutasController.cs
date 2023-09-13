using Demo_WebApp.API.DataModel;
using Demo_WebApp.API.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Threading;
using System.Web.Http;
using System.Web.Http.Cors;

namespace Demo_WebApp.API.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ApiFrutasController : ApiController
    {
        [HttpGet]
        [Route("api/frutas/obtener")]
        public IHttpActionResult ObtenerFrutas(string criterio = null)
        {
            try
            {
                Thread.Sleep(3000);
                using (MercaditoEntities context = new MercaditoEntities())
                {
                    if (String.IsNullOrEmpty(criterio) == false &&
                        context.Frutas.Any(f => f.nombre.ToLower().
                    Contains(criterio)))
                    {
                        return Content<List<Frutas>>
                        (HttpStatusCode.OK,
                        context.Frutas.Where(f => f.nombre.ToLower()
                        .Contains(criterio)).ToList(),
                        Configuration.Formatters.JsonFormatter);
                        //return Json<List<Frutas>>
                        //    (context.Frutas.Where(f => f.nombre.ToLower()
                        //.Contains(criterio)).ToList());
                        //return Ok(context.Frutas.Where(f => f.nombre.ToLower()
                        //.Contains(criterio)).ToList());
                    }

                    return Content<List<Frutas>>
                        (HttpStatusCode.Accepted,
                        context.Frutas.ToList(),
                        Configuration.Formatters.JsonFormatter);
                    //return Json<List<Frutas>>
                    //    (context.Frutas.ToList());
                    //return Ok(context.Frutas.ToList());
                }
            }
            catch (Exception ex)
            {
                return Content<Exception>(HttpStatusCode.InternalServerError,
                    ex, Configuration.Formatters.JsonFormatter);
                //return InternalServerError(ex);
            }
        }

        [HttpPost]
        [Route("api/frutas/agregar")]
        public IHttpActionResult AgregarFruta(Frutas fruta)
        {
            try
            {
                using (MercaditoEntities context =
                    new MercaditoEntities())
                {
                    context.Frutas.Add(fruta);
                    context.SaveChanges();
                }

                return Content<Frutas>(HttpStatusCode.Created,
                    fruta, Configuration.Formatters.JsonFormatter);
                //return Ok(fruta);
            }
            catch (Exception ex)
            {
                return Content<Exception>(HttpStatusCode.InternalServerError,
                    ex, Configuration.Formatters.JsonFormatter);
                //return InternalServerError(ex);
            }
        }

        [HttpPost]
        [Route("api/contacto/crear")]
        public IHttpActionResult AgregarContactoRequest
        (ContactoRequestModel model)
        {
            try
            {
                using (MercaditoEntities context
                    = new MercaditoEntities())
                {
                    ContactoRequest nuevo = new ContactoRequest()
                    {
                        nombre = model.nombre,
                        email = model.email,
                        asunto = model.asunto,
                        contactar = model.contactar,
                        mensaje = model.mensaje,
                        noticias = model.noticias,
                        prioridad = model.prioridad
                    };
                    context.ContactoRequest.Add(nuevo);
                    context.SaveChanges();
                    model.id = nuevo.id;
                    return Content<ContactoRequestModel>
                        (HttpStatusCode.Created,
                    model, Configuration.Formatters.JsonFormatter);
                }
            }
            catch (Exception ex)
            {
                return Content<Exception>(HttpStatusCode
                    .InternalServerError, ex, Configuration
                    .Formatters.JsonFormatter);
            }
        }

        [HttpGet]
        [Route("api/contacto/obtener")]
        public IHttpActionResult ObtenerContactoRequests()
        {
            try
            {
                List<ContactoRequestModel> crList
                    = new List<ContactoRequestModel>();
                using (MercaditoEntities context =
                    new MercaditoEntities())
                {
                    foreach (var item in context.ContactoRequest)
                    {
                        crList.Add(new ContactoRequestModel()
                        {
                            email = item.email,
                            id = item.id,
                            nombre = item.nombre,
                            asunto = item.asunto,
                            contactar = item.contactar ?? false,
                            mensaje = item.mensaje,
                            noticias = item.noticias ?? false,
                            prioridad = item.prioridad ?? 1
                        });
                    }
                }
                return Content<List<ContactoRequestModel>>
                        (HttpStatusCode.OK,
                    crList, Configuration.Formatters.JsonFormatter);
            }
            catch (Exception ex)
            {
                return Content<Exception>(HttpStatusCode
                    .InternalServerError, ex, Configuration
                    .Formatters.JsonFormatter);
            }
        }
    }
}
