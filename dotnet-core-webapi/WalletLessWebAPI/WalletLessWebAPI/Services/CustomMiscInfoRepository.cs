using System;
using System.Collections.Generic;
using System.Linq;
using WalletLessWebAPI.Entities;

namespace WalletLessWebAPI.Services
{
    public class CustomMiscInfoRepository : ICustomMiscInfoRepository
    {
        private WalletLessDBContext _context;

        public CustomMiscInfoRepository(WalletLessDBContext context)
        {
            _context = context;
        }

        public void AddCustomMiscInfo(CustomMiscInfo info)
        {
            _context.CustomMiscInfo.Add(info);
        }

        public bool CustomMiscInfoExists(int id)
        {
            return _context.CustomMiscInfo.Any(x => x.Id == id);
        }

        public void DeleteCustomMiscInfo(CustomMiscInfo info)
        {
            _context.CustomMiscInfo.Remove(info);
        }

        public CustomMiscInfo GetCustomMiscInfo(CustomMiscInfo id)
        {
            return _context.CustomMiscInfo.FirstOrDefault(x => x.Id == id);
        }

        public IEnumerable<CustomMiscInfo> GetCustomMiscInfo()
        {
            return _context.CustomMiscInfo.OrderBy(x => x.Id).ToList();
        }

        public IEnumerable<CustomMiscInfo> GetCustomMiscInfos(IEnumerable<int> ids)
        {
            return _context.CustomMiscInfo.Where(x => ids.Contains(x.Id)).OrderBy(y => y.Id).ToList();
        }

        public void updateCustomMiscInfo(int id, CustomMiscInfo info)
        {
            //copy the other files so i guess im still feeling lazy and ill do this another time
            var currUser = _context.CustomMiscInfo.FirstOrDefault(x => x.Id == id);

            currUser.user_info = info.user_info;
            currUser.type = info.type;
            currUser.cardNum = info.cardNum;

            _context.CustomMiscInfo.Update(currUser);
            _context.SaveChanges();
        }

        public bool Save()
        {
            return (_context.SaveChanges() >= 0);
        }
    }
}
