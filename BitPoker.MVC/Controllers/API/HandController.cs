﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace BitPoker.MVC.Controllers
{
    public class HandController : ApiController
    {
        private BitPoker.Repository.IHandRepository _repo;

        public HandController()
        {
            _repo = Repository.Factory.GetHandRepository();
        }

        public HandController(BitPoker.Repository.IHandRepository repo)
        {
            _repo = repo;
        }

        /// <summary>
        /// Get a specific hand via id
        /// </summary>
        /// <param name="id"></param>
        /// <param name="index"></param>
        /// <returns></returns>
        public BitPoker.Models.Hand Get(Guid id, Int32 index = 0)
        {
            BitPoker.Models.Hand hand = _repo.Find(id);
            return hand;
        }
    }
}
