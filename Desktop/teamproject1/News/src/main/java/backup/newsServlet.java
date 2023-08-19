package backup;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

@RequestMapping("/newsServlet")
public class newsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<newsArticles> newsArticles = new ArrayList<>();

        // Perform news crawling and populate the newsArticles list
        try {
            URL url = new URL("https://www.yna.co.kr/");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.connect();
            InputStream inputStream = connection.getInputStream();
            Scanner scanner = new Scanner(inputStream);
            String html = scanner.useDelimiter("\\A").next();

            Document document = Jsoup.parse(html);
            Elements newsElements = document.select("div.list_news .item");

            for (Element newsElement : newsElements) {
                String title = newsElement.select("a.title").text();
                String link = newsElement.select("a.title").attr("href");
                newsArticles.add(new newsArticles(title, link));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("newsArticles", newsArticles);
        request.getRequestDispatcher("board.jsp").forward(request, response);
    }
}
