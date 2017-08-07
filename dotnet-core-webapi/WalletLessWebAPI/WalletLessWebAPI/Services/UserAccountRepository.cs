using System;
using System.Collections.Generic;
using System.Linq;
using WalletLessWebAPI.Entities;

namespace WalletLessWebAPI.Services
{
    public class UserAccountRepository : IUserAccountRepository
    {
        private WalletLessDBContext _context;

        public UserAccountRepository(WalletLessDBContext context)
        {
            _context = context;
        }

        public void AddUserAccount(UserAccount user)
        {
            _context.UserAccount.Add(user);
        }

        public bool UserExists(string username)
        {
            return _context.UserAccount.Any(x => x.Username == username);
        }

        public void DeleteUserAccount(UserAccount user)
        {
            _context.UserAccount.Remove(user);
        }

        public UserAccount GetUserAccount(string username)
        {
            return _context.UserAccount.FirstOrDefault(x => x.Username == username);
        }

        public IEnumerable<UserAccount> GetAllUserAccounts()
        {
            return _context.UserAccount.OrderBy(x => x.Username).ToList();
        }

        public IEnumerable<UserAccount> GetUserAccounts(IEnumerable<string> usernames)
        {
            return _context.UserAccount.Where(x => usernames.Contains(x.Username)).OrderBy(y => y.Username).ToList();
        }

        public void UpdateUserAccount(UserAccount user)
        {
            //im feeling lazy ill do this another time
        }

        public bool Save()
        {
            return (_context.SaveChanges() >= 0);
        }
    }
}
