namespace db.pct;

using {
    db.pct.PCTExemptions,
    db.pct.PurchaseOrder,
    db.pct.PurchaseOrderItem
} from './PCTExemptions';


annotate PCTExemptions with {

    to_PurchaseOrderNo @Common.ValueList: {
        $Type         : 'Common.ValueListType',
        Label         : 'Purchase Order',
        CollectionPath: 'PurchaseOrder',

        //    FetchValues : true,

        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: to_PurchaseOrderNo_ID,
                ValueListProperty: 'ID',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'PurchaseOrderNo',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'poDate',
            },
        ],
    }

}


annotate PurchaseOrderItem with {

    to_PurchaseOrderNo @Common.ValueList: {
        $Type         : 'Common.ValueListType',
        Label         : 'Purchase Order',
        CollectionPath: 'PurchaseOrder',

        //    FetchValues : true,

        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: to_PurchaseOrderNo_ID,
                ValueListProperty: 'ID',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'PurchaseOrderNo',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'companyCode',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'plant',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'poDate',
            },
        ],
    }

}
