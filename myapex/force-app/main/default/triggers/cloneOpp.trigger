trigger cloneOpp on Opportunity (after insert, after update) {
    if (Trigger.isUpdate) {
        List<Order> listOrders = new List<Order>();
        for (Opportunity opp: Trigger.New) {
            if (opp.StageName == 'Closed Won') {
                Order orderNew = new Order();
                orderNew.OpportunityId = opp.Id;
                orderNew.AccountId = opp.AccountId;
                orderNew.ContractId = opp.ContractId;
                orderNew.EffectiveDate = Date.Today();
                listOrders.add(orderNew);
            }
        }
        if (listOrders.size() > 0) {
            insert listOrders;
        }
    }
}