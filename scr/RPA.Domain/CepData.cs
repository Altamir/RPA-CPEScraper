using System;

namespace RPA.Domain
{
    public class CepData
    {
        public CepData(string logradouro, string bairro, string localidade, string cep)
        {
            Logradouro = logradouro;
            Bairro = bairro;
            Localidade = localidade;
            Cep = cep;
        }

        public string Logradouro { get; }
        public string Bairro { get; }
        public string Localidade { get; }
        public string Cep { get; }
    }
}
