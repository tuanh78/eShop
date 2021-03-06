using eShop.Core.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace eShop.Core.Interfaces.Service
{
    public interface IUserService : IBaseService<User>
    {
        object Authentication(UserLoginRequest request);
    }
}