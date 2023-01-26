@isTest(isParallel=true)
private class AccountLookupFieldPiclistEditorTest {
    @isTest
    private static void shouldReturnLookupFieldsToAccount() {
        VisualEditor.DesignTimePageContext context = new VisualEditor.DesignTimePageContext();
        context.entityName = 'Case';
        context.pageType = 'RecordPage';

        VisualEditor.DynamicPicklistRows resultPicklist = new VisualEditor.DynamicPickListRows();

        Test.startTest();
        AccountLookupFieldPiclistEditor picklistEditor = new AccountLookupFieldPiclistEditor(context);
        resultPicklist = picklistEditor.getValues();
        Test.stopTest();

        

        VisualEditor.DataRow testRow = new VisualEditor.DataRow('Account ID', 'AccountId');
        VisualEditor.DataRow[] resultRows = resultPicklist.getDataRows();
        for(VisualEditor.DataRow row : resultRows){
            System.debug('Label: ' + row.getLabel() + ' Value: ' + row.getValue());
            System.debug(row);
        }
        Assert.isTrue(
            resultRows.contains(testRow),
            'an expected lookup was not found by the AccountLookupFieldPiclistEditor'
        );
    }

    @isTest
    private static void shouldReturnAnEmptyDefault() {
        VisualEditor.DesignTimePageContext context = new VisualEditor.DesignTimePageContext();
        context.entityName = 'Case';
        context.pageType = 'RecordPage';

        VisualEditor.DataRow defaultRow;

        Test.startTest();
        AccountLookupFieldPiclistEditor picklistEditor = new AccountLookupFieldPiclistEditor(context);
        defaultRow = picklistEditor.getDefaultValue();
        Test.stopTest();

        Assert.areEqual(
            '',
            defaultRow.getLabel(),
            'something has been incorrectly set for default row label (account picklist editor)'
        );
        Assert.areEqual(
            '',
            defaultRow.getValue(),
            'something has been incorrectly set for default row value (account picklist editor)'
        );
    }

    @isTest
    private static void shouldThrowExcWhenContextObjectHasNoRelToAccount() {
        VisualEditor.DesignTimePageContext context = new VisualEditor.DesignTimePageContext();
        context.entityName = 'OpportunityLineItem';
        context.pageType = 'RecordPage';

        Exception resultExc;

        Test.startTest();
        try {
            AccountLookupFieldPiclistEditor picklistEditor = new AccountLookupFieldPiclistEditor(context);
            VisualEditor.DynamicPicklistRows rows = picklistEditor.getValues();
        } catch (Exception ex) {
            resultExc = ex;
        }
        Test.stopTest();

        Assert.isInstanceOfType(
            resultExc,
            AccountLookupFieldPiclistEditor.NoAccountLookupException.class,
            'the wrong exception type was thrown or no exception was thrown'
        );
    }
}
