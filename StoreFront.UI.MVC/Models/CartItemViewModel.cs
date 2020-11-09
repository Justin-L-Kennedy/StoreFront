using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using StoreFront.DATA.EF;

namespace StoreFront.UI.MVC.Models
{
    public class CartItemViewModel
    {
        [Range(1, int.MaxValue)] //ensure values are greater than 0 but not greater than the max for the int datatype
        public int Qty { get; set; }

        public MoviesTV Product { get; set; }

        //FQCTOR
        public CartItemViewModel(int qty, MoviesTV product)
        {
            Qty = qty;
            Product = product;
        }
    }
}