using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using WalletLessWebAPI.Entities;
using WalletLessWebAPI.Services;
//using WalletLessWebAPI.Models;
//using AutoMapper;

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

        [HttpGet("[action]")]
        public IActionResult GetUserAccounts()
        {
            var usersFromRepo = _userAccountRepository.GetAllUserAccounts();
            //var users = Mapper.Map<IEnumerable<UserAccountDto>>(usersFromRepo);
            return new JsonResult(usersFromRepo);
        }

        [HttpGet("[action]/{id}")]
        public IActionResult GetUser(string id)
        {
            var usersFromRepo = _userAccountRepository.GetUserAccount(id);
            //var user = Mapper.Map<UserAccountDto>(usersFropRepo);
            return new JsonResult(usersFromRepo);
        }

        //should this use Dto and convert from Dto class?
        [HttpPost("[action]")]
        public IActionResult CreateUser(UserAccount user)
        {
            _userAccountRepository.AddUserAccount(user);
            _userAccountRepository.Save();
            return new JsonResult(user);
        }

        //same question as above here
        [HttpPut("[action]/{id}")]
        public IActionResult UpdateUser(String id, UserAccount user)
        {
            _userAccountRepository.UpdateUserAccount(id, user);
            _userAccountRepository.Save();
            return new JsonResult(user);
        }

        //patch

        [HttpDelete("[action]/{id}")]
        public IActionResult DeleteUser(UserAccount user)
        {
            _userAccountRepository.DeleteUserAccount(user);
            _userAccountRepository.Save();
            return new JsonResult(user);
        }
    }
}
