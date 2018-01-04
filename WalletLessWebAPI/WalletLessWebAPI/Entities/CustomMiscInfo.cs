using System;
using System.ComponentModel.DataAnnotations;

namespace WalletLessWebAPI.Entities
{
    public class CustomMiscInfo
    {

        [Key]
        public int Id { get; set; }

        public int user_info { get; set; }
        public string type { get; set; }
        public int cardNum { get; set; }
    }
}
