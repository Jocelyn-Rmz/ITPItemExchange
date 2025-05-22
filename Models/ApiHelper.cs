using System.Net.Http;
using System.Net.Http.Headers;

namespace ITPItemExchange.Models
{
    public static class ApiHelper
    {
        public static HttpClient Client { get; private set; }

        static ApiHelper()
        {
            Client = new HttpClient();
            Client.BaseAddress = new System.Uri("https://localhost:44375/");
            Client.DefaultRequestHeaders.Accept.Clear();
            Client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
        }
    }
}