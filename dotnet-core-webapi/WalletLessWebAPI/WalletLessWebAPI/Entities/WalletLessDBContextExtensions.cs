using System;
using System.Collections.Generic;

namespace WalletLessWebAPI.Entities
{
    public static class WalletLessDBContextExtensions
    {
        public static void EnsureSeedDataForContext(this WalletLessDBContext context)
        {
            context.UserAccount.RemoveRange(context.UserAccount);
            context.SaveChanges();

            var users = new List<UserAccount>()
            {
                new UserAccount()
                {
                    Username = "mattaquiles@gmail.com",
                    Password = "password",
                    AcctType = 0,
                    CreateDate = DateTime.Now,
                    IsActive = 1
                },
                new UserAccount()
                {
					Username = "test@@gmail.com",
					Password = "testpass",
					AcctType = 1,
					CreateDate = DateTime.Now,
					IsActive = 1
                }
            };

            context.UserAccount.AddRange(users);
            context.SaveChanges();
        }
    }
}
