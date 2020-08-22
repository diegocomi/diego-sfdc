({
    calcTotalRepayment : function(component) {

        var resultsMap = new Map();
        var principal = component.get("v.opportunity.Amount");
        var deposit = component.get("v.depositAmount");
        var annualRate = component.get("v.rate");
        var annualRate = annualRate/100;
        var repaymentPeriods = component.get("v.numMonths");

        var totalRepayment = Math.round((principal - deposit)*(1 + Math.pow((annualRate/repaymentPeriods),(repaymentPeriods/12))));
        var monthlyRepayment = Math.round(totalRepayment / repaymentPeriods);
        var totalInterest = Math.round(totalRepayment - (principal - deposit));

        resultsMap.set("Total Repayment", totalRepayment);
        resultsMap.set("Monthly Repayment",monthlyRepayment);
        resultsMap.set("Total Interest",totalInterest);

        return resultsMap;

    },

    getOpportunity: function(component){
        console.log("getOpp has fired.");
        var action = component.get("c.getOpportunity");
        action.setParams ({
            recordId : component.get("v.recordId")
        });

        action.setCallback(this,function(a) {
            if(a.getState() === "SUCCESS"  ){
                var thisOpportunity = a.getReturnValue();
                component.set("v.opportunity",thisOpportunity);
                $A.get('e.force:refreshView').fire();
            } else {
                console.log("Something went wrong with the callback function");
            }
        });
        $A.enqueueAction(action);
    },

    setHeaderText: function(component){
        console.log("setheadertext has fired");
        var rate = component.get("v.rate");
        var newTitle = "Quick Quote (" + rate + "% APR)";
        var newRateText = rate + "%";
        component.set("v.compHeader",newTitle);
        component.set("v.rateText",newRateText);
    },

    updateOpportunity: function(component){
        var update_action = component.get("c.updateOpportunity");
        update_action.setParams({
            opp : component.get("v.opportunity"),
            monthlyPay : component.get("v.monthlyRepayment"),
            totalInterest : component.get("v.totalInterest"),
            deposit : component.get("v.depositAmount"),
            totalPay : component.get("v.totalRepayment")
        })

        update_action.setCallback(this,function(b){
            if (b.getState() === "SUCCESS") {

            } else {
                console.log("Something has gone wrong with update_action")
            }

        })

        $A.enqueueAction(update_action);
    }
})