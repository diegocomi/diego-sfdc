({
    deleteDetail : function(component, event, helper) {

        var newEducationDetailsList = component.get("v.EducationListInnerComponent");
        var currentIndex = component.get("v.indexNo");
        if(currentIndex > 1){
            newEducationDetailsList.splice(currentIndex,1);
            component.set("v.EducationListInnerComponent",newEducationDetailsList);
        }

    }
})