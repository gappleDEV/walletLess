using System;
using System.Collections.Generic;
using WalletLessWebAPI.Entities;

namespace WalletLessWebAPI.Services
{
    public interface IUserAccountRepository
    {
        void AddUserAccount(UserAccount user);
        bool UserExists(string username);
        void DeleteUserAccount(UserAccount user);
        UserAccount GetUserAccount(string username);
        IEnumerable<UserAccount> GetAllUserAccounts();
        IEnumerable<UserAccount> GetUserAccounts(IEnumerable<string> usernames);
        void UpdateUserAccount(UserAccount user);
        bool Save();
    }
}