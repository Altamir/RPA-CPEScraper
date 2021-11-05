using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.DevTools.V85.Page;
using OpenQA.Selenium.Support.UI;
using RPA.Domain;

namespace RPA.WebScrape
{
    public class CepWebScraper : ICepWebScraper
    {
        readonly ChromeDriver chromeDriver;

        public CepWebScraper(ChromeDriver chromeDriver)
        {
            this.chromeDriver = chromeDriver;
        }

        public async Task<(string error, List<CepData> data)> Search(string cepForSeach)
        {
            try
            {

                List<CepData> results = new List<CepData>();

                chromeDriver.Manage().Timeouts().PageLoad = TimeSpan.MaxValue;
                chromeDriver.Navigate().GoToUrl("https://buscacepinter.correios.com.br/app/endereco/index.php");
                chromeDriver.FindElement(By.Id("endereco")).SendKeys(cepForSeach);
                var cepType = chromeDriver.FindElement(By.Name("tipoCEP"));
                var selectElement = new SelectElement(cepType);
                selectElement.SelectByValue("LOG");

                chromeDriver.FindElement(By.Id("btn_pesquisar")).Click();

                await Task.Delay(1000);

                var msg = chromeDriver.FindElement(By.Id("mensagem-resultado")).Text;

                var table = chromeDriver.FindElement(By.Id("resultado-DNEC"));
                var trs = table.FindElements(By.TagName("tr"));


                //TODO :  caso o CEP retorne mais item (paginação)
                //deveria mover pela paginação

                foreach (var tr in trs)
                {
                    var tds = tr.FindElements(By.TagName("td"));
                    if (tds.Count == 4)
                    {
                        var values = tds.Select(x => x.Text).ToArray();
                        results.Add(new CepData(values[0], values[1], values[2], values[3]));
                    }
                }

                return (results.Count == 0 ? msg : string.Empty, results);
            }
            catch (Exception ex)
            {
                return (ex.Message, new List<CepData>());
            }
        }
    }
}
