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
    public class CustomMiscInfoController : Controller
    {
        private ICustomMiscInfoRepository _customMiscInfoRepository;

        public CustomMiscInfoController(ICustomMiscInfoRepository customMiscInfoRepository)
        {
            _customMiscInfoRepository = customMiscInfoRepository;
        }

        [HttpGet()]
        public IActionResult GetCustomMiscInfo()
        {
            var infoFromRepo = _customMiscInfoRepository.GetAllCustomMiscInfo();
            var info = Mapper.Map<IEnumerable<CustomMiscInfoDto>>(infoFromRepo);
            return new JsonResult(info);
        }

        [HttpGet("{id")]
        public IActionResult GetCustomMiscInfo(int id)
        {
            var infoFromRepo = _customMiscInfoRepository.GetCustomMiscInfo(id);
            var info = Mapper.Map<CustomMiscInfoDto>(infoFromRepo);
            return new JsonResult(info);
        }

        //should this use dto and connect from dto class?
        [HttpPost()]
        public IActionResult CreateCustomMiscInfo(CustomMiscInfo info)
        {
            _customMiscInfoRepository.AddCustomMiscInfo(info);
            _customMiscInfoRepository.Save();
            return new JsonResult(info);
        }

        //same question as above
        [HttpPut()]
        public IActionResult UpdateCustomMiscInfo(int id, CustomMiscInfo info)
        {
            _customMiscInfoRepository.UpdateCustomMiscInfo(id, info);
            _customMiscInfoRepository.Save();
            return new JsonResult(info);
        }

        //patch

        [HttpDelete()]
        public IActionResult DeleteCustomMiscInfo(CustomMiscInfo info)
        {
            _customMiscInfoRepository.DeleteCustomMiscInfo(info);
            _customMiscInfoRepository.Save();
            return new JsonResult(info);
        }
    }
}