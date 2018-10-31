public class MindTouchRelatedArticleTrigger {
    public static void insertPost(String parentId, String articleId) {
        //Get Article information
        mindtouch_sf__MindTouch_Article__c article = [Select mindtouch_sf__Title__c, mindtouch_sf__URL__c from mindtouch_sf__MindTouch_Article__c where Id = :articleId];

        String title = article.mindtouch_sf__Title__c;
        String url = article.mindtouch_sf__URL__c;

        // {user} linked {object} to {article}
        // String userName = UserInfo.getName();
        String body = 'Shared "' + title +'"';

        FeedItem post = new FeedItem();
        post.ParentId = parentId;
        post.Body = body;
        post.LinkUrl = url;
        insert post;
    }
}