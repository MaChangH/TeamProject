package backup;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;

public class newsCrawler { // 클래스명을 NewsCrawler에서 MyNewsCrawler로 변경
    public static void main(String[] args) throws IOException {
        // URL 지정
        URL url = new URL("https://www.yna.co.kr/");

        // 응답 수신
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.connect();
        InputStream inputStream = connection.getInputStream();

        // HTML 문서로 파싱
        Scanner scanner = new Scanner(inputStream);
        String html = scanner.useDelimiter("\\A").next();

        // 제목, 링크 추출
        Document document = Jsoup.parse(html);
        Elements newsArticles = document.select("div.list_news .item");

        for (Element newsArticle : newsArticles) {
            String title = newsArticle.select("a.title").text();
            String link = newsArticle.select("a.title").attr("href");

            System.out.println(title + " " + link);
        }
    }
}