using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using WalletLessWebAPI.Entities;
using WalletLessWebAPI.Services;
using WalletLessWebAPI.Models;
using AutoMapper;

namespace WalletLessWebAPI.Controllers
{
    [Route("api/[controller]")]
    public class UserAccountController : Controller
    {
        private IUserAccountRepository _userAccountRepository;

        public UserAccountController(IUserAccountRepository userAccountRepository)
        {
            _userAccountRepository = userAccountRepository;
        }

        [HttpGet()]
        public IActionResult GetUserAccounts()
        {
            var usersFromRepo = _userAccountRepository.GetAllUserAccounts();
            var users = Mapper.Map<IEnumerable<UserAccountDto>>(usersFromRepo);
            return new JsonResult(users);
        }

        [HttpGet("{id}")]
        public IActionResult GetUser(string id)
        {
            var usersFropRepo = _userAccountRepository.GetUserAccount(id);

            var user = Mapper.Map<UserAccountDto>(usersFropRepo);
            return new JsonResult(user);
        }

        [HttpPost()]
        public IActionResult CreateUser(UserAccount user)
        {
            _userAccountRepository.AddUserAccount(user);
            _userAccountRepository.Save();
            return new JsonResult(user);
        }

        //put
        //[HttpPut("{id}")]
        //public IActionResult UpdateUser(UserAccount user, )

        //patch

        [HttpDelete()]
        public IActionResult DeleteUser(UserAccount user)
        {
            _userAccountRepository.DeleteUserAccount(user);
            _userAccountRepository.Save();
            return new JsonResult(user);
        }
    }
}
