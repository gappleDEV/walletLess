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
    public class BankInfoController : Controller
    {
        private IBankInfoRepository _bankInfoRepository;

        public BankInfoController(IBankInfoRepository bankInfoRepository)
        {
            _bankInfoRepository = bankInfoRepository;
        }

        [HttpGet()]
        public IActionResult GetBankInfo()
        {
            var infoFromRepo = _bankInfoRepository.GetAllBankInfo();
            var banks = Mapper.Map<IEnumerable<BankInfoDto>>(infoFromRepo);
            return new JsonResult(banks);
        }

        [HttpGet("{id}")]
        public IActionResult GetBankInfo(int id)
        {
            var infoFromRepo = _bankInfoRepository.GetBankInfo(id);
            var bank = Mapper.Map<BankInfoDto>(infoFromRepo);
            return new JsonResult(bank);
        }

        //should this use Dto and conert from Dto class?
        [HttpPost()]
        public IActionResult CreateBankInfo(BankInfo bank)
        {
            _bankInfoRepository.AddBankInfo(bank);
            _bankInfoRepository.Save();
            return new JsonResult(bank);
        }

        //same question as above here
        [HttpPut()]
        public IActionResult UpdateBankInfo(int id, BankInfo bank)
        {
            _bankInfoRepository.UpdateBankInfo(id, bank);
            _bankInfoRepository.Save();
            return new JsonResult(bank);
        }

        //patch

        [HttpDelete()]
        public IActionResult DeleteBankInfo(BankInfo bank)
        {
            _bankInfoRepository.DeleteBankInfo(bank);
            _bankInfoRepository.Save();
            return new JsonResult(bank);
        }
    }
}
