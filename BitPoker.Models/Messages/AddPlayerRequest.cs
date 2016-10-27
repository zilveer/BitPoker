﻿using System;

namespace BitPoker.Models.Messages
{
    public class AddPlayerRequest : BaseRequest
    {
        public PlayerInfo Player { get; set; }

        public AddPlayerRequest()
        {
            base.Version = 1.0M;
        }
    }
}
