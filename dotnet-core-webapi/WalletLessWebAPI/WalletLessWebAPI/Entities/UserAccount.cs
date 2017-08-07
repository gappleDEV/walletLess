using System;
using System.ComponentModel.DataAnnotations;

namespace WalletLessWebAPI.Entities
{
    public class UserAccount
    {
        [Key]
        public string Username { get; set; }

        public string Password { get; set; }
        public int AcctType { get; set; }
        public DateTime CreateDate { get; set; }
        public int IsActive { get; set; }
    }
}
