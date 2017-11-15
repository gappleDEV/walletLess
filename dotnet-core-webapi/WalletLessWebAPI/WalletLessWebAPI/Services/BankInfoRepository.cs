using System;
using System.Collections.Generic;
using System.Linq;
using WalletLessWebAPI.Entities;

namespace WalletLessWebAPI.Services
{
    public class BankInfoRepository : IBankInfoRepository
    {
        private WalletLessDBContext _context;

        public BankInfoRepository(WalletLessDBContext context)
        {
            _context = context;
        }

        public void AddBankInfo(BankInfo bank)
        {
            _context.BankInfo.Add(bank);
        }

        public bool BankInfoExists(int id)
        {
            return _context.BankInfo.Any(x => x.User_id == id);
        }

        public void DeleteBankInfo(BankInfo bank)
        {
            _context.BankInfo.Remove(bank);
        }

        public BankInfo GetBankInfo(int id)
        {
            return _context.BankInfo.FirstOrDefault(x => x.User_id == id);
        }

        public IEnumerable<BankInfo> GetAllBankInfo()
        {
            return _context.BankInfo.OrderBy(x => x.Id).ToList();
        }

        public IEnumerable<BankInfo> GetBankInfos(IEnumerable<int> ids)
        {
            return _context.BankInfo.Where(x => ids.Contains(x.User_id)).OrderBy(y => y.User_id).ToList();
        }

        public void UpdateBankInfo(int id, BankInfo bank)
        {
            //copy the other files so i guess im still feeling lazy and ill do this another time
            var currUser = _context.BankInfo.FirstOrDefault(x => x.Id == id);

            currUser.User_id = bank.User_id;
            currUser.Bank = bank.Bank;
            currUser.BankAddr = bank.BankAddr;
            currUser.BankType = bank.BankType;
            currUser.Brand = bank.Brand;
            currUser.CardNum = bank.CardNum;
            currUser.SecurityCode = bank.SecurityCode;

            _context.BankInfo.Update(currUser);
            _context.SaveChanges();
        }

        public bool Save()
        {
            return (_context.SaveChanges() >= 0);
        }
    }
}
