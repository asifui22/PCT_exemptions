namespace codes;

using {sap.common.CodeList, } from '@sap/cds/common';

type StatusEnum  : String enum {
    OPEN = 'Open';
    PENDIND = 'Pending';
    ACCEPTED = 'Apprved';
    RETURNED = 'Returned';
    CANCELLED = 'Cancelled';

} default 'OPEN';

entity Status : CodeList {
    key code : StatusEnum;
}

type PropActEnum : String enum {
    ED = 'Exclude Document from PCT calculation';
    DJ = 'Deduct justified delay period';
    NA = 'No change-Request not accepted.'

};
entity ProposedAction : CodeList {
    key code: PropActEnum;    
}
