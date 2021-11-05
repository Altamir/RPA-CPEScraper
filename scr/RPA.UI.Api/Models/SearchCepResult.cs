using System;
using System.Collections.Generic;
using RPA.Domain;

namespace RPA.UI.Api.Models
{
    public class SearchCepResult
    {
        public SearchCepResult(List<CepData> ceps, string msg)
        {
            Ceps = ceps;
            Msg = msg;
        }

        public List<CepData> Ceps { get; }
        public string Msg { get; }

        public bool IsSucess => Ceps.Count > 0;

    }
}
