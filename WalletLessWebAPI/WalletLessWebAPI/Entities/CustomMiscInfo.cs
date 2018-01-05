using System;
using System.ComponentModel.DataAnnotations;

namespace WalletLessWebAPI.Entities
{
    public class CustomMiscInfo
    {

        [Key]
        public int Id { get; set; }

        public int User_info { get; set; }
        public string Type { get; set; }
        public int CardNum { get; set; }
    }
}
