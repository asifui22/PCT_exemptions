namespace codes;

using {sap.common.CodeList, } from '@sap/cds/common';

type StatusEnum  : String enum {
    Open = 'Open';
    Pending = 'Pending';
    Approved = 'Approved';
    Rejected = 'Rejected';
    Cancelled = 'Cancelled';

} default 'Open';

entity Status : CodeList {
    key code        : StatusEnum @UI.Hidden;
        criticality : Integer; // 1= Red, 2= Yellow, 3= Green,
        readOnly    : Integer    @odata.Type: 'Edm.Byte'; // 1: #ReadOnly, 2: Enabled, 7: #Mandatory
        disable     : Boolean;
// editAble    : Boolean;
// deleteAble  : Boolean;
}

type PropActEnum : String enum {
    ED = 'Exclude Document from PCT calculation';
    DJ = 'Deduct justified delay period';
    NA = 'No change-Request not accepted.'

};

entity ProposedAction : CodeList {
    key code : PropActEnum @UI.Hidden;
}
