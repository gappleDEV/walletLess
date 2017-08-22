using System;
using System.Collections.Generic;
using System.Linq;
using WalletLessWebAPI.Entities;

namespace WalletLessWebAPI.Services
{
    //need to update all rountes to check if user exists already and to check if input is valid
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

        public void UpdateUserAccount(String id, UserAccount user)
        {
            //im feeling lazy ill do this another time
            var currUser = _context.UserAccount.FirstOrDefault(x => x.Username == id);

            currUser.Password = user.Password;
            currUser.AcctType = user.AcctType;
            currUser.IsActive = user.IsActive;

            _context.UserAccount.Update(currUser);
            _context.SaveChanges();
        }

        public bool Save()
        {
            return (_context.SaveChanges() >= 0);
        }
    }
}
