﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace P03_SalesDatabase.Data.Models
{
  public  class Product
    {
        public int ProductId { get; set; }
        [MaxLength(50)]
        public string Name { get; set; }
        public double Quantity { get; set; }
        public decimal Price { get; set; }
        [MaxLength(250)]
        public string Description { get; set; }
        public ICollection<Sale> Sales { get; set; }

    }
}
