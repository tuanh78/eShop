using eShop.Core.Entities;
using eShop.Core.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eShop.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class BaseController<T> : ControllerBase where T : class
    {
        private readonly IBaseService<T> _baseService;

        public BaseController(IBaseService<T> baseService)
        {
            _baseService = baseService;
        }

        [HttpGet("paging")]
        public IActionResult GetPaing([FromQuery] GetPagingRequest request)
        {
            var employees = _baseService.GetPaging(request);

            if (employees.Any())
            {
                return Ok(employees);
            }
            else
            {
                return NoContent();
            }
        }

        [HttpGet("total")]
        public IActionResult GetTotalPaing([FromQuery] GetPagingRequest request)
        {
            var employees = _baseService.GetTotalPaging(request);
            return Ok(employees);
        }
    }
}