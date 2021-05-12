using eShop.Core.Entities;
using eShop.Core.Interfaces.Repository;
using eShop.Core.Interfaces.Service;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace eShop.Core.Service
{
    public class UserService : BaseService<User>, IUserService
    {
        private IUserRepository _UserRepository;
        private readonly IConfiguration _config;

        public UserService(IUserRepository UserRepository, IConfiguration config) : base(UserRepository)
        {
            _UserRepository = UserRepository;
            _config = config;
        }

        /// <summary>
        /// Hàm đăng nhập
        /// </summary>
        /// <param name="request">Thông tin đăng nhập</param>
        /// <returns>Chuỗi token nếu đăng nhập hợp lệ, ngược lại thì null</returns>
        /// CreatedDate: 5/4/2021
        /// CreateBy: THTùngCreatedDate: 5/4/2021
        /// CreateBy: THTùng
        public object Authentication(UserLoginRequest request)
        {
            //var user = await _userManager.FindByNameAsync(request.UserName);
            //if (user == null) return new ApiErrorResult<string>("Tài khoản không tồn tại");

            //var result = await _signInManager.PasswordSignInAsync(user, request.Password, request.RememberMe, true);
            //if (!result.Succeeded)
            //{
            //    return new ApiErrorResult<string>("Đăng nhập không đúng");
            //}
            //var roles = await _userManager.GetRolesAsync(user);
            if (request.Username != "test" || request.Password != "test")
            {
                return null;
            }
            var claims = new[]
            {
                new Claim(ClaimTypes.GivenName,request.Username),
                new Claim(ClaimTypes.NameIdentifier, Guid.NewGuid().ToString()),
            };
            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Tokens:Key"]));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken(_config["Tokens:Issuer"],
                _config["Tokens:Issuer"],
                claims,
                expires: DateTime.Now.AddSeconds(60),
                signingCredentials: creds);
            var tokenString = new JwtSecurityTokenHandler().WriteToken(token);

            return new { fullname = request.Username, token = tokenString, expires = DateTime.Now.AddSeconds(60), ok = true };
        }
    }
}