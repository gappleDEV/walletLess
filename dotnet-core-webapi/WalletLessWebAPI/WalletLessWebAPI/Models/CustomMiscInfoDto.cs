using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WalletLessWebAPI.Models
{
    public class CustomMiscInfoDto
    {
        public int Id { get; set; }
        public int user_info { get; set; }
        public string type { get; set; }
        public int cardNum { get; set; }
    }
}
