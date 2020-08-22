({
    doSubmit : function(cmp, evt, hlp) {

        var currentABC = cmp.get("v.abc");
        if(currentABC == "false"){
            alert("the value is false");
            cmp.set("v.abc","true");
        } else {
            alert("the value is true");
            cmp.set("v.abc","false");
        }

    },

    doCheckboxClick : function(component, event, helper){

        //console.log("Controller Function called");
        helper.checkBoxValueSet(component,event);

    },

    addDetails : function(component,event,helper){
        console.log("Add education detail");
        var CurrentEducationDetailsList = component.get("v.EducationDetailsList");
        var currentSize = parseInt(CurrentEducationDetailsList.length);
        var newSize = parseInt((currentSize.length) + 1);
        CurrentEducationDetailsList.push(newSize);
        component.set("v.EducationDetailsList",CurrentEducationDetailsList);
    }
})