using System;
using System.Net;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KrishiSadhana
{
    public partial class Weather : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblLogout.Visible = false;
            lblProfile.Visible = false;

            if (Session["user"] != null && Session["user"].ToString() != "")
            {
                lblName.Text = Session["user"].ToString();
                lblLogout.Visible = true;
                lblProfile.Visible = true;
            }
            else
            {
                lblName.Text = "Login";
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string apiKey = "a8f7fed4dd022c50e23a4cfbb6e57584"; // OpenWeather API Key
            string city = txtCity.Text.Trim();

            if (!string.IsNullOrEmpty(city))
            {
                string url = $"https://api.openweathermap.org/data/2.5/weather?q={city}&units=metric&appid={apiKey}";

                using (WebClient client = new WebClient())
                {
                    try
                    {
                        string json = client.DownloadString(url);
                        JavaScriptSerializer js = new JavaScriptSerializer();
                        dynamic weatherData = js.Deserialize<dynamic>(json);

                        lblCity_Country.Text = $"{weatherData["name"]}, {weatherData["sys"]["country"]}";
                        lblDescription.Text = weatherData["weather"][0]["description"];
                        lblHumidity.Text = weatherData["main"]["humidity"] + "%";
                        lblTempMin.Text = weatherData["main"]["temp_min"] + "°C";
                        lblTempMax.Text = weatherData["main"]["temp_max"] + "°C";
                        lblTempDay.Text = weatherData["main"]["temp"] + "°C";
                        lblTempNight.Text = weatherData["main"]["feels_like"] + "°C";

                        string iconCode = weatherData["weather"][0]["icon"];
                        imgWeatherIcon.ImageUrl = $"https://openweathermap.org/img/wn/{iconCode}@2x.png";

                        // Set country flag (Using a public flag API)
                        string countryCode = weatherData["sys"]["country"];
                        imgCountryFlag.ImageUrl = $"https://flagcdn.com/w80/{countryCode.ToLower()}.png";
                    }
                    catch (Exception ex)
                    {
                        lblCity_Country.Text = "Invalid City!";
                        lblDescription.Text = "";
                        lblHumidity.Text = "";
                        lblTempMin.Text = "";
                        lblTempMax.Text = "";
                        lblTempDay.Text = "";
                        lblTempNight.Text = "";
                        imgWeatherIcon.ImageUrl = "";
                        imgCountryFlag.ImageUrl = "";
                    }
                }
            }
        }
    }
}
