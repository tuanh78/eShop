using System;
using System.Collections.Generic;
using System.Text;

namespace eShop.Core.Entities
{
    public class GetPagingRequest
    {
        public int PageIndex { get; set; } = 1;

        /// <summary>
        /// Số bản ghi trên 1 trang
        /// </summary>

        public int PageSize { get; set; } = 5;

        /// <summary>
        /// filter dữ liệu
        /// </summary>

        public string Filter { get; set; }
    }
}