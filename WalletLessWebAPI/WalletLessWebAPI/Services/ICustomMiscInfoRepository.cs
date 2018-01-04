using System;
using System.Collections.Generic;
using WalletLessWebAPI.Entities;

namespace WalletLessWebAPI.Services
{
    public interface ICustomMiscInfoRepository
    {
        void AddCustomMiscInfo(CustomMiscInfo info);
        bool CustomMiscInfoExists(int id);
        void DeleteCustomMiscInfo(CustomMiscInfo info);
        CustomMiscInfo GetCustomMiscInfo(int id);
        IEnumerable<CustomMiscInfo> GetAllCustomMiscInfo();
        IEnumerable<CustomMiscInfo> GetCustomMiscInfos(IEnumerable<int> ids);
        void UpdateCustomMiscInfo(int id, CustomMiscInfo info);
        bool Save();
    }
}
