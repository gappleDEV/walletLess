using System;
using System.Collections.Generic;
using WalletLessWebAPI.Entities;

namespace WalletLessWebAPI.Services
{
    public interface IBankInfoRepository
    {
        void AddBankInfo(BankInfo bank);
        bool BankInfoExists(int id);
        void DeleteBankInfo(BankInfo bank);
        BankInfo GetBankInfo(int id);
        IEnumerable<BankInfo> GetAllBankInfo();
        IEnumerable<BankInfo> GetBankInfos(IEnumerable<int> ids);
        void UpdateBankInfo(int id, BankInfo bank);
        bool Save();
    }
}
