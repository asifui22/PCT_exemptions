using srv.pct.PCTService as service from '../../srv/Services/PCTService';
annotate service.PCTExemptions with @(
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
                $Type : 'UI.DataField',
                Value : Requestdetails,
            },
            {
                $Type : 'UI.DataField',
                Label : 'to_Status_code',
                Value : to_Status_code,
            },
            {
                $Type : 'UI.DataField',
                Value : statusDate,
            },
            {
                $Type : 'UI.DataField',
                Value : assignedEngineer,
            },
            {
                $Type : 'UI.DataField',
                Label : 'to_ProposedAction_code',
                Value : to_ProposedAction_code,
            },
            {
                $Type : 'UI.DataField',
                Value : Attachments,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
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
    ],
);

