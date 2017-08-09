using System;
using System.Collections.Generic;
using System.Linq;
using WalletLessWebAPI.Entities;

namespace WalletLessWebAPI.Entities
{
    public class DbInitializer
    {
        public static void Initialize(WalletLessDBContext context)
        {
            context.Database.EnsureCreated();

            if (context.UserAccount.Any())
            {
                return; //db has been seeded
            }

            var users = new UserAccount[]
            {
                new UserAccount{Username="mattaquiles@gmail.com",Password="password",AcctType=1,CreateDate=DateTime.Now,IsActive=1},
                new UserAccount{Username="gregjohnson@gmail.com",Password="gregpass",AcctType=1,CreateDate=DateTime.Now,IsActive=1},
                new UserAccount{Username="testymctesterson@hotmail.com",Password="123pass!",AcctType=2,CreateDate=DateTime.Now,IsActive=1}
            };

            foreach (UserAccount u in users)
            {
                context.UserAccount.Add(u);
            }
            context.SaveChanges();
        }

    }
}
