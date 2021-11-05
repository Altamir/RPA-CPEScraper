using System.Collections.Generic;
using System.Threading.Tasks;

namespace RPA.Domain.Services
{
    public interface ICepSearchService
    {
        Task<(string error, List<CepData> data)> Search(string cepForSeach);
        Task<(string error, List<CepData> data)> SearchInCache(string cepForSeach);
    }
}