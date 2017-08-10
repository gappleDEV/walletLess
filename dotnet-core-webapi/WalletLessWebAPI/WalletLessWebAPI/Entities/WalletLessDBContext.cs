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

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<UserAccount>().ToTable("UserAccount");
        }
    }
}
