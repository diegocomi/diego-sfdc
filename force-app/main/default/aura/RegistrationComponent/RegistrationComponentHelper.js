({
    checkBoxValueSet : function(component, event) {

        //console.log("helper function called");
        var checkBoxValue = component.find("checkBox1").get("v.checked");
        component.set("v.courseTakenBefore",checkBoxValue);

    }
})