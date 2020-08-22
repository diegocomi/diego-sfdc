({
    calcAndSet : function(component, event, helper) {

        var resultsMap = helper.calcTotalRepayment(component);

        component.set("v.monthlyRepayment",resultsMap.get("Monthly Repayment"));
        component.set("v.totalRepayment",resultsMap.get("Total Repayment"));
        component.set("v.totalInterest",resultsMap.get("Total Interest"));

    },

    doInit : function(component,event,helper){
        helper.getOpportunity(component);
        helper.setHeaderText(component);
    },

    clickSave : function(component,event,helper){
        helper.updateOpportunity(component);
    }
})