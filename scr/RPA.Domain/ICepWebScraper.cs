using System.Collections.Generic;
using System.Threading.Tasks;
using RPA.Domain;

namespace RPA.WebScrape
{
    public interface ICepWebScraper
    {
        Task<(string error, List<CepData> data)> Search(string cepForSeach);
    }
}