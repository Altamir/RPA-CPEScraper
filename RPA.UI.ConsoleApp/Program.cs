using System;
using System.Threading.Tasks;
using OpenQA.Selenium.Chrome;
using RPA.Domain.Services;
using RPA.WebScrape;

namespace RPA.UI.ConsoleApp
{
    class Program
    {
        static async Task Main(string[] args)
        {
            #region [ Initialize Chrome Drive ]
            ChromeOptions chromeOptions = new ChromeOptions();
            chromeOptions.AddArguments("headless");
            var _drive = new ChromeDriver("/Users/altamir/Projects/Pessoal/IndigoSoftRPA/RPAIndigosoft/", chromeOptions);
            ICepWebScraper cepWebScraper = new CepWebScraper(_drive);
            ICepSearchService cepSeachService = new CepSearchService(cepWebScraper);
            #endregion [ Initialize Chrome Drive ]




            var (error, data) = await cepSeachService.Search("asdads");
            (error, data) = await cepSeachService.Search("90160");
            (error, data) = await cepSeachService.Search("90160092");

            (error, data) = await cepSeachService.Search("901");

            (error, data) = await cepSeachService.SearchInCache("90160092");

            Console.WriteLine("Hello World!");
        }
    }
}
