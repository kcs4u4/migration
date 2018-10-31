trigger MindTouchLinkCaseTrigger on mindtouch_sf__MindTouch_Related_Article_Case__c (after insert) {
    for(mindtouch_sf__MindTouch_Related_Article_Case__c relatedArticle : Trigger.new) {
        Case c = [Select Id, Subject, CaseNumber from Case where Id = :relatedArticle.mindtouch_sf__Case__c];
        MindTouchRelatedArticleTrigger.insertPost(c.Id, relatedArticle.mindtouch_sf__MindTouch_Article__c);
    }
}