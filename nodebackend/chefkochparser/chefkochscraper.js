// https://www.chefkoch.de/rezepte/3996041613062975/PausenCracker-Lunchbox-mit-Couscous-Salat.html

const axios = require("axios");
const Cheerio = require("cheerio");

async function getHTMLPageAsTextFromURL(url) {
  //try{
  let res = await axios.get(url);
  if (res && res.data) {
    let htmltext = res.data;
    return res.data;
    //}
  } else {
    return null;
  }
}

function chefkochHTMLToData(text, url) {
  try {
    $ = Cheerio.load(text);
    table_as_array = [];
    line = [];
    $(".ingredients > tbody > tr > td").each((index, element) => {
      let text = $(element).text().trim();
      text = text.replace(/\s+/gi, " ");
      line.push(text);
      if (line.length == 2) {
        table_as_array.push(line);
        line = [];
      }
    });
    data = table_as_array.map((el) => {
      return { amount: el[0], foodName: el[1] };
    });
    return { recipe: data, error: false, url: url };
  } catch (ex) {
    return { recipe: [], error: true, url: url };
  }
}

async function chefkochURLToData(url) {
  let html = await getHTMLPageAsTextFromURL(url);
  if (!html) return { recipe: [], error: true, url: url };
  let data = chefkochHTMLToData(html, url);
  return data;
}

async function run() {
  let url =
    "https://www.chefkoch.de/rezepte/3996311613127280/Kuerbis-Hummus-Dip-mit-PausenCracker.html";
  let data = await chefkochURLToData(url);
  console.log(data);
}

module.exports.chefkochURLToData = chefkochURLToData;
