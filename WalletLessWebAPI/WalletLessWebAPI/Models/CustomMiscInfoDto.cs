using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WalletLessWebAPI.Models
{
    public class CustomMiscInfoDto
    {
        public int Id { get; set; }
        public int User_info { get; set; }
        public string Type { get; set; }
        public int CardNum { get; set; }
    }
}
