using srv.pct.PCTService as service from '../../srv/Services/PCTService';





annotate service.PCTExemptions with @(


    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : requestNo,
            // @HTML5.CssDefaults : {
            //     $Type : 'HTML5.CssDefaultsType',
            //     width : '5cm',
            // },
        },
        {
            $Type : 'UI.DataField',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Value : to_Status_code,
            Criticality : to_Status.criticality,
            CriticalityRepresentation : #WithoutIcon,
        },
        {
            $Type : 'UI.DataField',
            Value : to_PRNumber,

        },
        {
            $Type : 'UI.DataField',
            Value : pRLastApprovalDate,
        },
        {
            $Type : 'UI.DataField',
            Value : RFQNo,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'srv.pct.PCTService.submit',
            Label : 'submit',
        },
    ],
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : requestNo,
            },
            {
                $Type : 'UI.DataField',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Value : to_Status_code,
            },
            {
                $Type : 'UI.DataField',
                Value : statusDate,
            },
            {
                $Type : 'UI.DataField',
                Value : to_ProposedAction_code,
            },
            {
                $Type : 'UI.DataField',
                Value : assignedEngineer,
            },
            // {
            //     $Type : 'UI.DataField',
            //     Value : Attachments,
            // },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Purchase Order Detail',
            ID : 'PRDeatail',
            Target : '@UI.FieldGroup#PRDeatail',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Request Detail',
            ID : 'RequestDetail',
            Target : '@UI.FieldGroup#RequestDetail',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Attachments',
            ID : 'Attachments',
            Target : '@UI.FieldGroup#Attachments',
        },
    ],
    
    UI.FieldGroup #PRDeatail : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : to_PurchaseOrderNo_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : pRLastApprovalDate,
            },
            {
                $Type : 'UI.DataField',
                Value : to_PRNumber,
            },
            {
                $Type : 'UI.DataField',
                Value : RFQNo,
            },
        ],
    },
    UI.HeaderInfo : {
        TypeName : 'Procurement Cycle Time',
        TypeNamePlural : 'Procurement Cycle Time',
        Title : {
            $Type : 'UI.DataField',
            Value : requestNo,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : title,
        },
        Initials : to_PRNumber,
    },
    UI.SelectionPresentationVariant #tableView : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
        Text : 'Procurement Cycle Time',
    },
    UI.FieldGroup #RequestDetail : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : Requestdetails,
            },
        ],
    },
    UI.FieldGroup #RequestDetail1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    },
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Administrated Information',
            ID : 'AdministratedInformation',
            Target : '@UI.FieldGroup#AdministratedInformation',
        },
    ],
    UI.FieldGroup #AdministratedInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedAt,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedBy,
            },
        ],
    },
    UI.FieldGroup #Attachments : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : Attachments,
                Label : 'Attachments',
            },
            {
                $Type : 'UI.DataField',
                Value : fileName,
                Label : 'fileName',
            },
        ],
    },
);

// annotate service.PCTExemptions with {
//     requestNo @(
//         Common.ExternalID : requestNo,
//         Common.Text : title,
//     )
// };

annotate service.PurchaseOrder with @(
    UI.LineItem #tableView : [
        {
            $Type : 'UI.DataField',
            Value : PurchaseOrderNo,
        },
        {
            $Type : 'UI.DataField',
            Value : POStatus,
        },
        {
            $Type : 'UI.DataField',
            Value : poDate,
        },
        {
            $Type : 'UI.DataField',
            Value : plant,
        },
        {
            $Type : 'UI.DataField',
            Value : companyCode,
        },
        {
            $Type : 'UI.DataField',
            Value : BusinessPartner,
        },
    ],
    UI.SelectionPresentationVariant #tableView : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem#tableView',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
        Text : 'Purchase Order',
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'General Information',
            ID : 'GeneralInformation',
            Target : '@UI.FieldGroup#GeneralInformation',
        },
    ],
    UI.FieldGroup #GeneralInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : PurchaseOrderNo,
            },
            {
                $Type : 'UI.DataField',
                Value : poDate,
            },
            {
                $Type : 'UI.DataField',
                Value : companyCode,
            },
            {
                $Type : 'UI.DataField',
                Value : BusinessPartner,
            },
        ],
    },
    UI.HeaderInfo : {
        TypeName : 'Purchase Order',
        TypeNamePlural : 'Purchase Order',
        Title : {
            $Type : 'UI.DataField',
            Value : PurchaseOrderNo,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : PurchaseOrderNo,
        },
    },
);

