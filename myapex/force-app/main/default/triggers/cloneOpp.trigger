trigger cloneOpp on Opportunity (after insert, after update) {
    if (Trigger.isUpdate) {
        List<Order> listOrders = new List<Order>();
        for (Opportunity opp: Trigger.New) {
            if (opp.StageName == 'Closed Won') {
                Order orderNew = opp.clone();
                listOrders.add(orderNew);
            }
        }
        if (listOrders.size() > 0) {
            insert listOrders;
        }
    }
}