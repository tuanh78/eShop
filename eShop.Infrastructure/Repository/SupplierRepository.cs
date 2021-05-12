﻿using eShop.Core.Entities;
using eShop.Core.Interfaces.Repository;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Text;

namespace eShop.Infrastructure.Repository
{
    public class SupplierRepository:BaseRepository<Supplier>,ISupplierRepository
    {
        public SupplierRepository(IConfiguration configuration):base(configuration)
        {

        }
    }
}
