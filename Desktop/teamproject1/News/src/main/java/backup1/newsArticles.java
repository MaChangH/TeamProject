package backup1;

public class newsArticles {
    private String title;
    private String link;

    public newsArticles(String title, String link) {
        this.title = title;
        this.link = link;
    }

    public String getTitle() {
        return title;
    }

    public String getLink() {
        return link;
    }
}