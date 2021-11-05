using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using RPA.Domain;
using RPA.Domain.Services;
using RPA.UI.Api.Models;

namespace RPA.UI.Api.Controllers
{
    [ApiController]
    [Route("api/cep")]
    public class BuscaCepController : ControllerBase
    {
        [HttpGet()]
        public async Task<SearchCepResult> searchCep(
            [FromServices] ICepSearchService cepSearchService,
            [FromQuery] string search)
        {
            var (error, data) = await cepSearchService.Search(search);
            return Handler(error, data);
        }

        [HttpGet("cache")]
        public async Task<SearchCepResult> searchCepCache(
            [FromServices] ICepSearchService cepSearchService,
            [FromQuery] string search)
        {
            var (error, data) = await cepSearchService.SearchInCache(search);
            return Handler(error, data);
        }

        private static SearchCepResult Handler(string error, List<CepData> data)
        {
            if (data.Count == 0) return new SearchCepResult(new(), error);
            return new SearchCepResult(data, string.Empty);
        }
    }
}
