public class ClassRenewalOppClone {
    public void cloneOpp(List<Opportunity> cloneOpp, map<Id,Opportunity> oldMap) {
        System.debug('cloneopp---'+cloneOpp);
        System.debug('oldMap---'+oldMap);
        String recordTypeName = 'Renewals';
        Map<String, Schema.RecordTypeInfo> rtMapByName = Schema.SObjectType.Opportunity.getRecordTypeInfosByName();
        Schema.RecordTypeInfo rtInfo =  rtMapByName.get(recordTypeName);
        id recType = rtInfo.getRecordTypeId();
        System.debug('recTyperecType'+recType);
        
        FOR(Opportunity opp1 : cloneOpp) {
            IF(opp1.StageName.contains('Closed Won') ) {
                String OppId = opp1.Id;
                System.debug('OppId'+OppId);
                
                //Clone the Opportunity that is associated with the handoff and all createable fields
                /* query Opportunity and then clone it */
                
                String soql = CSUtils.getCreatableFieldsSOQL('Opportunity', 'Id =: OppId');
                System.debug('soql'+soql);
                Opportunity opp = (Opportunity)Database.query(soql);
                System.debug('opp'+opp);
                Opportunity opp2 = opp.clone(false, true);
                opp2.Name=opp.Name+' Renewal';
                opp2.StageName='open';
                opp2.CloseDate=opp.CloseDate+365;
                insert opp2;
                System.debug('opp2'+opp2);
                
                List<OpportunityLineItem> itemList = (List<OpportunityLineItem>)Database.query(CSUtils.getCreatableFieldsSOQL('OpportunityLineItem', 'OpportunityId =: OppId'));
                
                List<OpportunityLineItem> newItemList = new List<OpportunityLineItem>();
                for (OpportunityLineItem item : itemList) {
                    OpportunityLineItem ol = item.clone(false, true);
                    ol.totalprice = null;
                    ol.opportunityid = opp2.id;
                    newItemList.add(ol);
                }
                insert newItemList;
                
                List<Quote> quoteList = (List<Quote>)Database.query(CSUtils.getCreatableFieldsSOQL('Quote', 'OpportunityId =: OppId'));
                
                List<Quote> newquote = new List<Quote>();
                for (Quote item : quoteList) {
                    System.debug('item' +item);
                    Quote ol = item.clone(false, true);
              //      ol.totalprice = null;
                    ol.opportunityid = opp2.id;
                    newquote.add(ol);
                }
                insert newquote;
            }
        }
    }
}