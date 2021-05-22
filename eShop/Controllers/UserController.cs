using eShop.Core.Entities;
using eShop.Core.Interfaces.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eShop.Controllers
{
    [Route("api/v1/[controller]s")]
    [ApiController]
    public class UserController : BaseController<User>
    {
        private IUserService _userService;

        public UserController(IUserService userService) : base(userService)
        {
            _userService = userService;
        }

        /// <summary>
        /// Lấy toàn bộ dữ liệu
        /// </summary>
        /// <returns>
        /// 200 - thành công
        /// 204 - lỗi
        /// </returns>
        [HttpGet]
        public IActionResult GetAll()
        {
            var user = _userService.GetAll();
            if (user.Count() > 0)
            {
                return Ok(user);
            }
            else
            {
                return NoContent();
            }
        }

        /// <summary>
        /// Lấy theo id
        /// </summary>
        /// <param name="id"></param>
        /// <returns>200 - thành công
        /// 404 - Id không tồn tại
        /// </returns>
        [HttpGet("{id}")]
        public IActionResult GetById(Guid id)
        {
            var user = _userService.GetById(id);
            if (user == null)
            {
                return StatusCode(204);
            }
            return Ok(user);
        }

        /// <summary>
        /// Thêm mới bản ghi
        /// </summary>
        /// <param name="user"></param>
        /// <returns>201 - thêm thành công (trả về bản ghi vừa thêm)
        /// 204 - thêm thất bại</returns>
        [HttpPost]
        public IActionResult Post(User user)
        {
            var res = _userService.Insert(user);
            if (res > 0)
            {
                return StatusCode(201, user);
            }
            else
            {
                return NoContent();
            }
        }

        /// <summary>
        /// Sửa bản ghi
        /// </summary>
        /// <param name="id"></param>
        /// <param name="user"></param>
        /// <returns>200 - sửa thành công
        /// 204 - sửa thất bại</returns>
        [HttpPut("{id}")]
        public IActionResult Put(Guid id, User user)
        {
            var res = _userService.Update(user);
            if (res > 0)
            {
                return StatusCode(200);
            }
            else
            {
                return NoContent();
            }
        }

        /// <summary>
        /// Xóa bản ghi
        /// </summary>
        /// <param name="id"></param>
        /// <returns>
        /// 200 - xóa thành công
        /// 204 - xóa thất bại</returns>
        [HttpDelete("{id}")]
        public IActionResult Detele(Guid id)
        {
            var res = _userService.Delete(id);
            if (res > 0)
            {
                return StatusCode(200);
            }
            return NoContent();
        }

        /// <summary>
        /// Phương thức đăng nhập
        /// </summary>
        /// <param name="request">Thông tin đăng nhập</param>
        /// <returns>Trả về token</returns>
        /// <response code="200">Trả về token nếu đăng nhập thành công!</response>
        /// <response code="204">Đăng nhập thất bại!</response>
        /// CreatedDate: 5/4/2021
        /// CreateBy: THTùng
        [HttpPost("/api/v1/auth/login")]
        public IActionResult Authenticate([FromBody] UserLoginRequest request)
        {
            var result = _userService.Authentication(request);
            if (result != null)
            {
                return Ok(result);
            }
            else
            {
                return StatusCode(StatusCodes.Status404NotFound, "Sai tài khoản hoặc mật khẩu!");
            }
        }
    }
}