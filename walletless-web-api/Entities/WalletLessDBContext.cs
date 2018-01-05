using System;
using Microsoft.EntityFrameworkCore;

namespace WalletLessWebAPI.Entities
{
    public class WalletLessDBContext : DbContext
    {
        public WalletLessDBContext(DbContextOptions<WalletLessDBContext> options) : base(options)
        {
            //Database.Migrate();
        }

        public DbSet<UserAccount> UserAccount { get; set; }
        //public DbSet<BankInfo> BankInfo { get; set; }
        //public DbSet<CustomMiscInfo> CustomMiscInfo { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<UserAccount>().ToTable("UserAccount");
            //modelBuilder.Entity<BankInfo>().ToTable("BankInfo");
            //modelBuilder.Entity<CustomMiscInfo>().ToTable("CustomMiscInfo");
        }
    }
}