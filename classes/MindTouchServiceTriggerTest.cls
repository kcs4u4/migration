@IsTest(SeeAllData=true)
private class MindTouchServiceTriggerTest {

    private static testMethod void testCaseTrigger() {
        //Create Case
        Case c = new Case();
        insert c;

        //Create MindTouch Article
        mindtouch_sf__MindTouch_Article__c mindTouchArticle = createMindTouchArticle();

        //Create the relation
        mindtouch_sf__MindTouch_Related_Article_Case__c relatedArticle = new mindtouch_sf__MindTouch_Related_Article_Case__c();
        relatedArticle.mindtouch_sf__Case__c = c.id;
        relatedArticle.mindtouch_sf__MindTouch_Article__c = mindTouchArticle.id;
        insert relatedArticle;

        List<FeedItem> feed = [SELECT Id FROM FeedItem WHERE ParentId = :c.id];
        system.assertEquals(1, feed.size());
    }

    private static mindtouch_sf__MindTouch_Article__c createMindTouchArticle() {
        mindtouch_sf__MindTouch_Article__c mindTouchArticle = new mindtouch_sf__MindTouch_Article__c();
        mindTouchArticle.mindtouch_sf__PageID__c = 'site_1:1';
        mindTouchArticle.mindtouch_sf__Title__c = 'article';
        mindTouchArticle.mindtouch_sf__URL__c = 'http://www.mindtouch.com/article';
        insert mindTouchArticle;

        return mindTouchArticle;
    }
}