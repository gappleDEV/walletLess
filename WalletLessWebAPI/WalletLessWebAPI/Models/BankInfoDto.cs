using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WalletLessWebAPI.Models
{
    public class BankInfoDto
    {
        public int Id { get; set; }
        public int User_id { get; set; }
        public string Bank { get; set; }
        public string BankAddr { get; set; }
        public string BankType { get; set; }
        public string Brand { get; set; }
        public int AccntNum { get; set; }
        public int RoutingNum { get; set; }
        public int CardNum { get; set; }
        public int SecurityCode { get; set; }
    }
}
