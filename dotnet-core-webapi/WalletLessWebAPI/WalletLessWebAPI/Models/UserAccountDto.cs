using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WalletLessWebAPI.Models
{
    public class UserAccountDto
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public int AcctType { get; set; }
        public DateTime CreateDate { get; set; }
        public int IsActive { get; set; }
    }
}
