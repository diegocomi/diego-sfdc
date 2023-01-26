public without sharing class AccountLookupFieldPiclistEditor extends VisualEditor.DynamicPickList {
    VisualEditor.DesignTimePageContext context;

    public AccountLookupFieldPiclistEditor(VisualEditor.DesignTimePageContext context) {
        this.context = context;
    }

    public override VisualEditor.DataRow getDefaultValue() {
        VisualEditor.DataRow defaultValue = new VisualEditor.DataRow('', '');
        return defaultValue;
    }

    public override VisualEditor.DynamicPicklistRows getValues() {
        VisualEditor.DynamicPicklistRows rows = new VisualEditor.DynamicPicklistRows();

        Schema.SObjectType recordPageObject = Schema.getGlobalDescribe().get(context.entityName);
        Schema.ChildRelationship[] accountChildObjects = Account.getSObjectType().getDescribe().getChildRelationships();

        for (Schema.ChildRelationship relationship : accountChildObjects) {
            if (relationship.getChildSObject() == recordPageObject) {
                Schema.DescribeFieldResult lookupField = relationship.getField().getDescribe();
                rows.addRow(new VisualEditor.DataRow(lookupField.getLabel(), lookupField.getName()));
            }
        }

        if (rows.getDataRows().isEmpty()) {
            NoAccountLookupException noAccountExc = new NoAccountLookupException();
            noAccountExc.setMessage('No lookup fields to account were found for the object this page refers to');
            throw noAccountExc;
        }
        return rows;
    }

    public class NoAccountLookupException extends Exception {
    }
}
