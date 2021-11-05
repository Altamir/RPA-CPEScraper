using System.Collections.Generic;
using System.Threading.Tasks;
using RPA.WebScrape;

namespace RPA.Domain.Services
{
    public class CepSearchService : ICepSearchService
    {
        readonly ICepWebScraper cepWebScraper;

        readonly Dictionary<string, (string, List<CepData>)> _items = new Dictionary<string, (string, List<CepData>)>();


        public CepSearchService(ICepWebScraper cepWebScraper)
        {
            this.cepWebScraper = cepWebScraper;
        }

        public async Task<(string error, List<CepData> data)> Search(string cepForSeach)
        {
            var (error, data) = await cepWebScraper.Search(cepForSeach);

            if (_items.ContainsKey(cepForSeach) == false)
            {
                _items[cepForSeach] = (string.Empty, new List<CepData>());
            }
            _items[cepForSeach] = (error, data);
            return _items[cepForSeach];
        }

        public async Task<(string error, List<CepData> data)> SearchInCache(string cepForSeach)
        {
            return _items.ContainsKey(cepForSeach) == false ?
                    ("Ainda não efetuaou pesquisa para esse item", new List<CepData>()) :
                    _items[cepForSeach];
        }
    }
}
